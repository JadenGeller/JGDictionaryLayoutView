//
//  JGSubviewHelper.m
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 3/2/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "JGSubviewHelper.h"

@implementation JGSubviewHelper

+(Class)classForSubviewKeys:(NSArray*)subviewKeys{
    if ([subviewKeys containsObject:@"text"]) return [UILabel class];
    else return [UIView class];
}

@end
