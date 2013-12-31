//
//  NSDictionary+Loading.m
//
//  Created by Jaden Geller on 8/19/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "NSDictionary+Loading.h"

@implementation NSDictionary (Plexer)

+(NSDictionary*)dictionaryWithFileName:(NSString*)name{
    return [[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:name ofType:@"plist"]];
}

@end
