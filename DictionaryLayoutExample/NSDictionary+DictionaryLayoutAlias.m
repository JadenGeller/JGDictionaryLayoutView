//
//  NSDictionary+DictionaryLayoutAlias.m
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 3/3/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "NSDictionary+DictionaryLayoutAlias.h"
#import "JGDictionaryAlias.h"

@implementation NSDictionary (DictionaryLayoutAlias)

-(id)objectForAlias:(id)aKey{
    id notAliasObject = [self objectForKey:aKey];
    
    // prioritize normal
    if (notAliasObject) return notAliasObject;
    else{
        NSString *alias = [JGDictionaryAlias aliasForKey:aKey];
        id aliasObject = [self objectForKey:alias];
        
        // return alias if possible
        if (aliasObject) return aliasObject;
        
        // else act as if we did nothing
        else return notAliasObject;
    }

}

@end
