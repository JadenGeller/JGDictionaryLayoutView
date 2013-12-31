//
//  NSShadow+Creation.m
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "NSShadow+Creation.h"
#import "UIColor+Creation.h"

@implementation NSShadow (Creation)

+(NSShadow*)shadowWithDictionary:(NSDictionary*)dictionary{
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake([dictionary[@"offsetX"] doubleValue], [dictionary[@"offsetY"] doubleValue]);
    shadow.shadowColor = [UIColor colorWithObject:dictionary[@"color"] forProperty:@"shadow color"];
    shadow.shadowBlurRadius = [dictionary[@"blurRadius"] doubleValue];
    return shadow;
}

@end
