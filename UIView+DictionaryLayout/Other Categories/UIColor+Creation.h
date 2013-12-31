//
//  UIColor+Creation.h
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Creation)

+(UIColor*)colorWithHex:(NSString*)hexString;
+(UIColor*)colorWithName:(NSString*)name alpha:(CGFloat)alpha;
+(UIColor*)colorWithObject:(NSObject*)object forProperty:(NSString*)identifier;

@end
