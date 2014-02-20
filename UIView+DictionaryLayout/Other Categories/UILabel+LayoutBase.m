//
//  UILabel+LayoutBase.m
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "UILabel+LayoutBase.h"
#import "NSException+Assertion.h"
#import "NSAttributedString+Creation.h"

@implementation UILabel (LayoutBase)

-(void)setDictionaryText:(NSObject*)obj{
    if (!obj) {
        self.text = nil;
    }
    else {
        self.attributedText = [NSAttributedString stringWithObject:obj];
    }
}

@end
