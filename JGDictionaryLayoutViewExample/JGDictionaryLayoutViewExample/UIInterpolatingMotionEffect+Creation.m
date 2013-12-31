//
//  UIInterpolatingMotionEffect+Creation.m
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "UIInterpolatingMotionEffect+Creation.h"

@implementation UIInterpolatingMotionEffect (Creation)

+(NSArray*)motionEffectsWithDepth:(NSNumber*)depth{
    
    NSNumber *negativeDepth = @(-depth.doubleValue);
    
    UIInterpolatingMotionEffect *xMotion = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    UIInterpolatingMotionEffect *yMotion = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    xMotion.maximumRelativeValue = negativeDepth;
    xMotion.minimumRelativeValue = depth;
    
    yMotion.maximumRelativeValue = negativeDepth;
    yMotion.minimumRelativeValue = depth;
    
    return @[xMotion, yMotion];
}

@end
