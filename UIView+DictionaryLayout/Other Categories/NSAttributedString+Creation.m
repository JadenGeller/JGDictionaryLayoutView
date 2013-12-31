//
//  NSAttributedString+Creation.m
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "NSAttributedString+Creation.h"
#import "NSAttributedString+Attributes.h"

@implementation NSAttributedString (Creation)

+(NSAttributedString*)stringWithObject:(NSObject*)object{
    if ([object isKindOfClass:[NSString class]]) {
        return [[NSAttributedString alloc] initWithString:(NSString*)object];
    }
    else if([object isKindOfClass:[NSArray class]]){
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc]init];
        for (NSObject *child in (NSArray*)object) {
            [string appendAttributedString:[NSAttributedString stringWithObject:child]];
        }
        return string;
    }
    else if([object isKindOfClass:[NSDictionary class]]){
        NSDictionary *dictionary = (NSDictionary*)object;
        
        return [[NSAttributedString alloc]initWithString:dictionary[@"text"] attributes:[NSAttributedString attributeDictionaryWithDictionary:dictionary]];
    }
    else{
        [NSException raise:@"Bad text type" format:@"Text property types should be of type NSArray/NSString/NSDictionary but it is of type '%@'", object.class];
        return nil;
    }
}

+(NSDictionary*)attributeDictionaryWithDictionary:(NSDictionary*)dictionary{
    NSMutableDictionary *attributeDictionary;
    
    for (NSString *key in dictionary) {
        
        NSString *capitalizedKey = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] capitalizedString]];
        NSString *attributeName = [NSString stringWithFormat:@"NS%@AttributeName",capitalizedKey];
        
        SEL getObject = NSSelectorFromString([NSString stringWithFormat:@"get%@Object:",capitalizedKey]);
        
        if ([self respondsToSelector:getObject]) {
            IMP imp = [self methodForSelector:getObject];
            NSObject* (*func)(id, SEL, NSObject*) = (void *)imp;
            attributeDictionary[attributeName] = func(self, getObject, dictionary[key]);
        }
        else{
            [NSException raise:@"Unknown attribute" format:@"Attribute '%@' is unknown", key];
        }
        
    }
    
    return attributeDictionary;
}

@end
