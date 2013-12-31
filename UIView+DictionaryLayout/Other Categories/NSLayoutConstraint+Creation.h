//
//  NSLayoutConstraint+Creation.h
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Creation)

+(NSArray*)constraintsWithDictionary:(NSDictionary*)dictionary view:(UIView*)subview;
+(NSArray*)constraintsWithDictionary:(NSDictionary*)dictionary view:(UIView*)subview forHorizontal:(BOOL)horizontal;

@end
