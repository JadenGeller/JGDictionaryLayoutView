//
//  NSLayoutConstraint+Creation.m
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "NSLayoutConstraint+Creation.h"

@implementation NSLayoutConstraint (Creation)

+(NSArray*)constraintsWithDictionary:(NSDictionary*)dictionary view:(UIView*)subview{
    // Returns both horizontal and vertical constraints
    return [[NSLayoutConstraint constraintsWithDictionary:dictionary view:subview forHorizontal:YES]arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithDictionary:dictionary view:subview forHorizontal:NO]];
}

+(NSArray*)constraintsWithDictionary:(NSDictionary*)dictionary view:(UIView*)subview forHorizontal:(BOOL)horizontal{
    
    // Check to make sure properties used are defined
    NSArray *defined = @[@"left",@"right",@"centerX",@"width",@"top",@"bottom",@"centerY",@"height"];

    for (NSString *key in dictionary) {
        if (![defined containsObject:key]) {
            [NSException raise:@"Invalid position property" format:@"Position property '%@' is not a valid position property",key];
        }
    }
    
    // Abstracted for both horizontal and vertical
    NSNumber *size = dictionary[horizontal ? @"width" : @"height"];
    NSNumber *leading = dictionary[horizontal ? @"left" : @"top"];
    NSNumber *trailing = dictionary[horizontal ? @"right" : @"bottom"];
    NSNumber *middle = dictionary[horizontal ? @"centerX" : @"centerY"];
    
    // Scale as a percentage of max
    NSLayoutAttribute maxAttribute = horizontal ? NSLayoutAttributeRight : NSLayoutAttributeBottom;
    
    NSMutableArray *constraints = [NSMutableArray array];
    
    // Allows specification of 2 of the 3 attributes (leading, middle, trailing)
    // Autolayout will complain if all 3 are specified in an impossible combination
    if (middle) {
        NSLayoutAttribute centerAttribute = horizontal ? NSLayoutAttributeCenterX : NSLayoutAttributeCenterY;
        [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:centerAttribute relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:maxAttribute multiplier:middle.doubleValue constant:0]];
    }
    if(leading){
        NSLayoutAttribute leadingAttribute = horizontal ? NSLayoutAttributeLeft : NSLayoutAttributeTop;
        [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:leadingAttribute relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:maxAttribute multiplier:leading.doubleValue constant:0]];
    }
    if(trailing){
        NSLayoutAttribute trailingAttribute = horizontal ? NSLayoutAttributeRight : NSLayoutAttributeBottom;
        [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:trailingAttribute relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:maxAttribute multiplier:trailing.doubleValue constant:0]];
    }
    if (size) {
        NSLayoutAttribute sizeAttribute = horizontal ? NSLayoutAttributeWidth : NSLayoutAttributeHeight;
        [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:sizeAttribute relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:sizeAttribute multiplier:size.doubleValue constant:0]];
    }
    
    // Return's mutable array; could return immutable copy, but this is more efficient
    return constraints;
    
}


@end
