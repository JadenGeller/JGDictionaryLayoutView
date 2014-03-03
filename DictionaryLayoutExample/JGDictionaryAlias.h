//
//  JGDictionaryAlias.h
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 3/3/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGDictionaryAlias : NSObject

+(NSString*)aliasForKey:(NSString*)key;
+(NSString*)keyForAlias:(NSString*)alias;

@end
