//
//  JGDictionaryAlias.m
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 3/3/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "JGDictionaryAlias.h"

@interface JGDictionaryAlias ()

@property (nonatomic) NSMutableDictionary *aliasWithKey;
@property (nonatomic) NSMutableDictionary *keyWithAlias;

@end

@implementation JGDictionaryAlias

-(void)addAssociations{
    
    // add all associations here
    // [self assocateAlias:@"aliasThing" toKey:@"realThing"];
    
    [self assocateAlias:@"fontName" toKey:@"name"];
    [self assocateAlias:@"dog" toKey:@"color"];
}

+(JGDictionaryAlias*)sharedInstance{

    static dispatch_once_t onceToken = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static JGDictionaryAlias *_sharedDictionaryAlias = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&onceToken, ^{
        _sharedDictionaryAlias = [[JGDictionaryAlias alloc] init];
        [_sharedDictionaryAlias addAssociations];
    });
    
    // returns the same object each time
    return _sharedDictionaryAlias;
}

-(id)init{
    self = [super init];
    if (self) {
        _aliasWithKey = [NSMutableDictionary dictionary];
        _keyWithAlias = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void)assocateAlias:(NSString*)alias toKey:(NSString*)key{
    [self.aliasWithKey setObject:alias forKey:key];
    [self.keyWithAlias setObject:key forKey:alias];
}

+(NSString*)aliasForKey:(NSString*)key{
    return [[[JGDictionaryAlias sharedInstance]aliasWithKey]objectForKey:key] ? : key;
}

+(NSString*)keyForAlias:(NSString*)alias{
    return [[[JGDictionaryAlias sharedInstance]keyWithAlias]objectForKey:alias] ? : alias;
}

@end
