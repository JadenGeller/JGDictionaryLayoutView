//
//  UIView+DictionaryLayout.h
//  JGDictionaryLayoutViewExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDictionary+Loading.h"

@interface UIView (DictionaryLayout)

-(void)setLayout:(NSDictionary *)layout;
-(void)setLayout:(NSDictionary *)layout withReusedProperties:(NSSet *)reusedProperties;

@end
