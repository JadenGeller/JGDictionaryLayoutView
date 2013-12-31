//
//  NSValue+Class.h
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValue (Class)

+(NSValue*)valueWithClass:(Class)theClass;
-(Class)classValue;

@end
