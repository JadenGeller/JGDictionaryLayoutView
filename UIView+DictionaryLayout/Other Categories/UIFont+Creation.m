//
//  UIFont+Creation.m
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "UIFont+Creation.h"
#import "NSDictionary+DictionaryLayoutAlias.h"

@implementation UIFont (Creation)

+(UIFont*)fontWithObject:(NSObject*)object{
    NSString *fontName;
    CGFloat fontSize;
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        fontName = [(NSDictionary*)object objectForAlias:@"name"];
        NSNumber *fontSizeObject = [(NSDictionary*)object objectForAlias:@"size"];
        
        fontSize = fontSizeObject ? fontSizeObject.doubleValue : [UIFont labelFontSize];
        
    }
    else if([object isKindOfClass:[NSString class]]){
        // name
        
        fontName = (NSString*)object;
    }
    else if([object isKindOfClass:[NSNumber class]]){
        // size
        NSNumber *fontSizeObject = (NSNumber*)object;
        
        fontSize = fontSizeObject ? fontSizeObject.doubleValue : [UIFont labelFontSize];
    }
    else{
        [NSException raise:@"Wrong font object type" format:@"Font object must be dictionary type"];
        return nil;
    }
    
    if (fontName) {
        return [UIFont fontWithName:fontName size:fontSize];
    }
    else{
        return [UIFont systemFontOfSize:fontSize];
    }
    
}

@end
