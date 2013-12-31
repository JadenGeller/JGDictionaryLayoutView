//
//  NSException+Assertion.h
//  JGDictionaryLayoutViewExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSException (Assertion)

+(BOOL)assertObject:(NSObject*)object isKindOfClass:(Class)objectClass forProperty:(NSString*)identifier;
+(BOOL)assertObject:(NSObject*)object isKindOfClasses:(NSArray*)objectClasses forProperty:(NSString*)identifier;

@end

@interface NSValue (Class)

+(NSValue*)valueWithClass:(Class)theClass;
-(Class)classValue;

@end