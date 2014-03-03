//
//  UIView+LayoutBase.m
//
//  Created by Jaden Geller on 12/29/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "UIView+LayoutBase.h"

#import "UIView+DictionaryLayout.h"
#import "UIColor+Creation.h"
#import "NSLayoutConstraint+Creation.h"
#import "UIInterpolatingMotionEffect+Creation.h"
#import "NSException+Assertion.h"

#import "JGSubviewHelper.h"

@implementation UIView (LayoutBase)

-(void)setDictionaryLayoutColor:(NSObject*)obj{
    if (!obj) {
        self.backgroundColor = nil;
    }
    else if ([NSException assertObject:obj isKindOfClasses:@[[NSValue valueWithClass:[NSString class]],[NSValue valueWithClass:[NSDictionary class]]] forProperty:@"tag"]) {
        self.backgroundColor = [UIColor colorWithObject:obj forProperty:@"color"];
    }
}

-(void)setDictionaryLayoutTag:(NSObject*)obj{
    if (!obj) {
        self.tag = 0;
    }
    else if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"tag"]) {
        self.tag = [(NSNumber*)obj integerValue];
    }
}

-(void)setDictionaryLayoutAlpha:(NSObject*)obj{
    if (!obj) {
        self.alpha = 1;
    }
    else if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"layout"]) {
        self.alpha = [(NSNumber*)obj doubleValue];
    }
}

-(void)setDictionaryLayoutOpaque:(NSObject*)obj{
    if (!obj) {
        self.opaque = YES;
    }
    else if([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"opaque"]){
        self.opaque = [(NSNumber*)obj boolValue];
    }
}

-(void)setDictionaryLayoutSubviews:(NSObject*)obj{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if ([NSException assertObject:obj isKindOfClass:[NSArray class] forProperty:@"subviews"]) {
        for (NSDictionary *subviewLayout in (NSArray*)obj) {
            if (![subviewLayout isKindOfClass:[NSDictionary class]]) {
                [NSException raise:@"Bad subview type" format:@"Subviews should be of type NSDictionary but it is of type '%@'", subviewLayout.class];
            }
            Class subviewClass = [JGSubviewHelper classForSubviewKeys:subviewLayout.allKeys];
            if (![subviewClass isSubclassOfClass:[UIView class]]) {
                [NSException raise:@"Invalid subview class" format:@"Subview class must inherit from UIView"];
            }
            UIView *subview = [[subviewClass alloc]init];
            [self addSubview:subview];
            
            // Set layout after added so constraints can be added to superview
            subview.layout = subviewLayout;
        }
    }
}

-(void)setDictionaryLayoutDepth:(NSObject*)obj{

    if ([self respondsToSelector:@selector(motionEffects)]) {
        
        //Remove all motion effects
        for (UIMotionEffect *motion in self.motionEffects) {
            [self removeMotionEffect:motion];
        }
        
        if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"depth"]) {
            NSArray *effects = [UIInterpolatingMotionEffect motionEffectsWithDepth:(NSNumber*)obj];
            for (UIInterpolatingMotionEffect *effect in effects){
                [self addMotionEffect:effect];
            }
        }
        
    }
}

-(void)setDictionaryLayoutPosition:(NSObject*)obj{
    // Remove all constraints from superview pertaining to self
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if (constraint.firstItem == self || constraint.secondItem == self) {
            [self.superview removeConstraint:constraint];
        }
    }
    
    if ([NSException assertObject:obj isKindOfClass:[NSDictionary class] forProperty:@"position"]) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self.superview addConstraints:[NSLayoutConstraint constraintsWithDictionary:(NSDictionary*)obj view:self]];
    }
}

-(void)setDictionaryLayoutTransform3D:(NSObject*)obj{
    
}

@end
