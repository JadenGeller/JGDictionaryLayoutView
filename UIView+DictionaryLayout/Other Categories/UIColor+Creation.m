//
//  UIColor+Creation.m
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "UIColor+Creation.h"

const CGFloat kMaxColorValue = 255.0;

@implementation UIColor (Creation)

+(UIColor*)colorWithHex:(NSString*)hex{
    if (![hex hasPrefix:@"#"]) [NSException raise:@"Invalid hext number for color" format:@"Hex number %@ is not prefixed with a '#' character",hex];
    if (hex.length!=7 && hex.length!=9) [NSException raise:@"Invalid hex number" format:@"Hex number %@ is not of format #RRGGBB or #RRGGBBAA", hex];
    
    BOOL success = YES;
    
    NSString *redDigits = [hex substringWithRange:NSMakeRange(1, 2)];
    unsigned int redNum;
    success *= [[NSScanner scannerWithString:redDigits] scanHexInt:&redNum];
    
    NSString *greenDigits = [hex substringWithRange:NSMakeRange(3, 2)];
    unsigned int greenNum;
    success *= [[NSScanner scannerWithString:greenDigits] scanHexInt:&greenNum];
    
    NSString *blueDigits = [hex substringWithRange:NSMakeRange(5, 2)];
    unsigned int blueNum;
    success *= [[NSScanner scannerWithString:blueDigits] scanHexInt:&blueNum];
    
    unsigned int alphaNum = kMaxColorValue;
    if (hex.length == 9) {
        NSString *alphaDigits = [hex substringWithRange:NSMakeRange(7, 2)];
        success *= [[NSScanner scannerWithString:alphaDigits] scanHexInt:&alphaNum];
    }
    
    if (!success) [NSException raise:@"Invalid hex number for color" format:@"Hex number %@ contains invalid hex digits", hex];
    
    return [UIColor colorWithRed:redNum/kMaxColorValue green:greenNum/kMaxColorValue blue:blueNum/kMaxColorValue alpha:alphaNum/kMaxColorValue];
}

+(UIColor*)colorWithName:(NSString*)name alpha:(CGFloat)alpha{
    name = [name stringByReplacingOccurrencesOfString:@"grey" withString:@"gray"]; // Fixes likely typo
    
    SEL colorSelector = NSSelectorFromString([name stringByAppendingString:@"Color"]);
    
    if (![UIColor respondsToSelector:colorSelector]) [NSException raise:@"Named color does not exist" format:@"Color with name '%@' does not exist", name];
    return [[UIColor performSelector:colorSelector] colorWithAlphaComponent:alpha];
}

+(UIColor*)colorWithObject:(NSObject*)object forProperty:(NSString*)identifier{
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dictionary = (NSDictionary*)object;
        
        CGFloat alpha = [UIColor verifiedFloatWithNumber:dictionary[@"alpha"] max:1.0 min:0.0 defaultVal:1.0 identifier:@"alpha"];
        if (dictionary[@"name"]) {
            return [[UIColor colorWithObject:dictionary[@"name"] forProperty:identifier] colorWithAlphaComponent:alpha];
        }
        else if (dictionary[@"hue"] || dictionary[@"saturation"] || dictionary[@"brightness"]) {
            CGFloat hue = [UIColor verifiedFloatWithNumber:dictionary[@"hue"] max:kMaxColorValue min:0.0 defaultVal:0.0 identifier:@"hue"];
            CGFloat saturation = [UIColor verifiedFloatWithNumber:dictionary[@"saturation"] max:1.0 min:0.0 defaultVal:0.0 identifier:@"saturation"];
            CGFloat brightness = [UIColor verifiedFloatWithNumber:dictionary[@"brightness"] max:1.0 min:0.0 defaultVal:0.0 identifier:@"brightness"];
            
            return [UIColor colorWithHue:hue/kMaxColorValue saturation:saturation brightness:brightness alpha:alpha];
        }
        else if(dictionary[@"red"] || dictionary[@"green"] || dictionary[@"blue"]){
            CGFloat red = [UIColor verifiedFloatWithNumber:dictionary[@"red"] max:1.0 min:0.0 defaultVal:0.0 identifier:@"red"];
            CGFloat green = [UIColor verifiedFloatWithNumber:dictionary[@"green"] max:1.0 min:0.0 defaultVal:0.0 identifier:@"green"];
            CGFloat blue = [UIColor verifiedFloatWithNumber:dictionary[@"blue"] max:1.0 min:0.0 defaultVal:0.0 identifier:@"blue"];

            return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        }
        else if(dictionary[@"white"]){
            CGFloat white = [UIColor verifiedFloatWithNumber:dictionary[@"white"] max:1.0 min:0.0 defaultVal:0.0 identifier:@"white"];
            
            return [UIColor colorWithWhite:white alpha:alpha];
        }
        else{
            [NSException raise:@"Bad dictionary keys" format:@"Dictionary keys for color of bad type"];
            return nil;

        }
    }
    else if([object isKindOfClass:[NSString class]]){
        NSString *string = (NSString*)object;
        if ([string hasPrefix:@"#"]) return [UIColor colorWithHex:string];
        else return [UIColor colorWithName:string alpha:1.0];
    }
    else{
        [NSException raise:@"Bad property type" format:@"Property '%@' should be of type 'NSDictionary' or 'NSString' but it is of type '%@'", identifier, object.class];
        return nil;
    }
}

#pragma mark - Private Methods

// Not a category because, if the number is nil, we don't want it to return nil
+(CGFloat)verifiedFloatWithNumber:(NSNumber*)number max:(CGFloat)max min:(CGFloat)min defaultVal:(CGFloat)defaultVal identifier:(NSString*)identifier{
    if (!number) {
        return defaultVal;
    }
    else{
        if (number.floatValue > max || number.floatValue < min){
            [NSException raise:@"Invalid value for color" format:@"Color %@ value must be inclusively between %f and %f", identifier, min, max];
        }
        return number.doubleValue;
    }
}


@end
