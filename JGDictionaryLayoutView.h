//
//  JGDictionaryLayoutView.h
//
//  Created by Jaden Geller on 12/29/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSValue+Class.h"
#import "NSDictionary+Loading.h"

@interface JGDictionaryLayoutView : UIView

@property (nonatomic) NSDictionary *layout;
@property (nonatomic) NSSet *reusedProperties;

+(BOOL)assertObject:(NSObject*)object isKindOfClass:(Class)objectClass forProperty:(NSString*)identifier;
+(BOOL)assertObject:(NSObject*)object isKindOfClasses:(NSArray*)objectClasses forProperty:(NSString*)identifier;

@end
