//
//  UIView+DictionaryLayout.m
//  JGDictionaryLayoutViewExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "UIView+DictionaryLayout.h"
#import "JGDictionaryAlias.h"

@implementation UIView (DictionaryLayout)

-(void)setLayout:(NSDictionary *)layout{
    [self setLayout:layout withReusedProperties:nil];
}

// Set defaults for reuse
-(void)setLayout:(NSDictionary *)layout withReusedProperties:(NSSet *)reusedProperties{
    
    NSSet *keys = [[NSSet setWithArray:layout.allKeys] setByAddingObjectsFromSet:reusedProperties];
    for (NSString *key in keys) {
        NSString *keyFromAlias = [JGDictionaryAlias keyForAlias:key];
        NSString *capitalizedKey = [keyFromAlias stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[keyFromAlias substringToIndex:1] capitalizedString]];

        SEL property = NSSelectorFromString([NSString stringWithFormat:@"setDictionaryLayout%@:",capitalizedKey]);
        if ([self respondsToSelector:property]) {
            IMP imp = [self methodForSelector:property];
            void (*func)(id, SEL, NSObject*) = (void *)imp;
            func(self, property, layout[key]);
        }
        else{
            [NSException raise:@"Unknown property" format:@"Property '%@' is unknown for class %@", keyFromAlias, self.class];
        }
    }
}

-(void)prepareForReuse{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
