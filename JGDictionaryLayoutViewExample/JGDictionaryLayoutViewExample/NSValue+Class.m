//
//  NSValue+Class.m
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "NSValue+Class.h"

@implementation NSValue (Class)

+(NSValue*)valueWithClass:(Class)theClass{
    return [NSValue valueWithBytes:&theClass objCType:@encode(Class)];
}

-(Class)classValue{
    Class theClass;
    if (strcmp([self objCType], @encode(Class)) == 0) [self getValue:&theClass];
    else [NSException raise:@"Cannot unbox Class value" format:@"NSValue does not encode a Class"];
        
    return theClass;
}

@end
