//
//  JGDictionaryLayoutView+Base.m
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

@implementation UIView (LayoutBase)

-(void)setLayoutColor:(NSObject*)obj{
    if (!obj) {
        self.backgroundColor = nil;
    }
    else if ([NSException assertObject:obj isKindOfClasses:@[[NSValue valueWithClass:[NSString class]],[NSValue valueWithClass:[NSDictionary class]]] forProperty:@"tag"]) {
        self.backgroundColor = [UIColor colorWithObject:obj forProperty:@"color"];
    }
}

-(void)setLayoutTag:(NSObject*)obj{
    if (!obj) {
        self.tag = 0;
    }
    else if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"tag"]) {
        self.tag = [(NSNumber*)obj integerValue];
    }
}

-(void)setLayoutAlpha:(NSObject*)obj{
    if (!obj) {
        self.alpha = 1;
    }
    else if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"layout"]) {
        self.alpha = [(NSNumber*)obj doubleValue];
    }
}

-(void)setLayoutOpaque:(NSObject*)obj{
    if (!obj) {
        self.opaque = YES;
    }
    else if([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"opaque"]){
        self.opaque = [(NSNumber*)obj boolValue];
    }
}

-(void)setLayoutSubviews:(NSObject*)obj{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if ([NSException assertObject:obj isKindOfClass:[NSArray class] forProperty:@"subviews"]) {
        for (NSDictionary *subviewLayout in (NSArray*)obj) {
            if (![subviewLayout isKindOfClass:[NSDictionary class]]) {
                [NSException raise:@"Bad subview type" format:@"Subviews should be of type NSDictionary but it is of type '%@'", subviewLayout.class];
            }
            
            UIView *subview = [[UIView alloc]init];
            subview.layout = subviewLayout;
            [self addSubview:subview];
        }
    }
}

-(void)setLayoutDepth:(NSObject*)obj{

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

-(void)setLayoutPosition:(NSObject*)obj{
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

@end
