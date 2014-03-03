//
//  NSString+DictionaryLayoutAlias.m
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 3/3/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "NSString+DictionaryLayoutAlias.h"
#import "JGDictionaryAlias.h"

@implementation NSString (DictionaryLayoutAlias)

-(BOOL)isEqualOrAliased:(NSString*)string{
    NSString *alias = [JGDictionaryAlias aliasForKey:string];
    
    if ([self isEqualToString:string] || (alias && [self isEqualToString:alias])) return YES;
    else return NO;
}

@end
