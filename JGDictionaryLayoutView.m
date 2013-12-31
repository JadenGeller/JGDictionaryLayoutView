//
//  JGDictionaryLayoutView.m
//
//  Created by Jaden Geller on 12/29/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "JGDictionaryLayoutView.h"

// Import methods here
#import "JGDictionaryLayoutView+Base.h"

@implementation JGDictionaryLayoutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

+(BOOL)assertObject:(NSObject*)object isKindOfClass:(Class)objectClass forProperty:(NSString*)identifier{
    if ([object isKindOfClass:objectClass]){
        return YES;
    }
    else{
        [NSException raise:@"Bad property type" format:@"Property '%@' should be of type '%@' but it is of type '%@'", identifier, objectClass, object.class];
        return NO;
    }
}

+(BOOL)assertObject:(NSObject*)object isKindOfClasses:(NSArray*)objectClasses forProperty:(NSString*)identifier{
    for (NSValue *value in objectClasses) {
        if ([object isKindOfClass:[value classValue]]){
            return YES;
        }
    }
    
    // Bad type, let's create a valuable exception
    NSMutableString *acceptableClasses = [NSMutableString string];
    
    BOOL firstValue = YES;
    for (NSValue *value in objectClasses) {
        [acceptableClasses appendFormat:@"%@",[value classValue]];
        
        if (firstValue) {
            [acceptableClasses appendString:@"/"];
            firstValue = NO;
        }
    }
    [NSException raise:@"Bad property type" format:@"Property '%@' should be of type '%@' but it is of type '%@'", identifier, acceptableClasses, object.class];
    return NO;
}

-(void)setLayout:(NSDictionary *)layout{
    _layout = layout;
    
    NSSet *keys = [[NSSet setWithArray:layout.allKeys] setByAddingObjectsFromSet:self.reusedProperties];
    for (NSString *key in keys) {
        
        NSString *capitalizedKey = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] capitalizedString]];
        SEL property = NSSelectorFromString([NSString stringWithFormat:@"setLayout%@:",capitalizedKey]);
        if ([self respondsToSelector:property]) {
            IMP imp = [self methodForSelector:property];
            void (*func)(id, SEL, NSObject*) = (void *)imp;
            func(self, property, layout[key]);
        }
        else{
            [NSException raise:@"Unknown property" format:@"Property '%@' is unknown", key];
        }
    }
}


@end
