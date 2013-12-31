//
//  NSException+Assertion.m
//  JGDictionaryLayoutViewExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "NSException+Assertion.h"

@implementation NSException (Assertion)

+(BOOL)assertObject:(NSObject*)object isKindOfClass:(Class)objectClass forProperty:(NSString*)identifier{
    if ([object isKindOfClass:objectClass]){
        return YES;
    }
    else{
        [NSException raise:@"Bad property type" format:@"Property '%@' should be of type '%@' but it is of type '%@'", identifier, objectClass, object.class];
        return NO;
    }
}

+(BOOL)assertObject:(NSObject*)object isKindOfClasses:(NSArray*)objectClasses forProperty:(NSString*)identifier{
    for (NSValue *value in objectClasses) {
        if ([object isKindOfClass:[value classValue]]){
            return YES;
        }
    }
    
    // Bad type, let's create a valuable exception
    NSMutableString *acceptableClasses = [NSMutableString string];
    
    BOOL firstValue = YES;
    for (NSValue *value in objectClasses) {
        [acceptableClasses appendFormat:@"%@",[value classValue]];
        
        if (firstValue) {
            [acceptableClasses appendString:@"/"];
            firstValue = NO;
        }
    }
    [NSException raise:@"Bad property type" format:@"Property '%@' should be of type '%@' but it is of type '%@'", identifier, acceptableClasses, object.class];
    return NO;
}

@end

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