//
//  NSAttributedString+Attributes.m
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "NSAttributedString+Attributes.h"
#import "UIColor+Creation.h"
#import "UIFont+Creation.h"
#import "NSException+Assertion.h"
#import "NSShadow+Creation.h"

@implementation NSAttributedString (Attributes)

+(NSString*)stringForAttributeIdentifier:(NSString*)identifier{
    if ([identifier isEqualToString:@"font"]) return NSFontAttributeName;
    else if ([identifier isEqualToString:@"foregroundColor"]) return NSForegroundColorAttributeName;
    else if ([identifier isEqualToString:@"backgroundColor"]) return NSBackgroundColorAttributeName;
    else if ([identifier isEqualToString:@"ligature"]) return NSLigatureAttributeName;
    else if ([identifier isEqualToString:@"kern"]) return NSKernAttributeName;
    else if ([identifier isEqualToString:@"strikethroughStyle"]) return NSStrikethroughStyleAttributeName;
    else if ([identifier isEqualToString:@"underlineStyle"]) return NSUnderlineStyleAttributeName;
    else if ([identifier isEqualToString:@"strokeColor"]) return NSStrokeColorAttributeName;
    else if ([identifier isEqualToString:@"strokeWidth"]) return NSStrokeWidthAttributeName;
    else if ([identifier isEqualToString:@"shadow"]) return NSShadowAttributeName;
    else if ([identifier isEqualToString:@"textEffect"]) return NSTextEffectAttributeName;
    else if ([identifier isEqualToString:@"link"]) return NSLinkAttributeName;
    else if ([identifier isEqualToString:@"baselineOffset"]) return NSBaselineOffsetAttributeName;
    else if ([identifier isEqualToString:@"underlineColor"]) return NSUnderlineColorAttributeName;
    else if ([identifier isEqualToString:@"strikethroughColor"]) return NSStrikethroughStyleAttributeName;
    else if ([identifier isEqualToString:@"obliqueness"]) return NSObliquenessAttributeName;
    else if ([identifier isEqualToString:@"expansion"]) return NSExpansionAttributeName;
    else return nil;
}

+(NSObject*)getFontObject:(NSObject*)obj{
    return [UIFont fontWithObject:obj];
}

//+(NSObject*)getParagraphStyleObject:(NSObject*)obj{
//
//}

+(NSObject*)getForegroundColorObject:(NSObject*)obj{
    return [UIColor colorWithObject:obj forProperty:@"text foreground color"];
}

+(NSObject*)getBackgroundColorObject:(NSObject*)obj{
    return [UIColor colorWithObject:obj forProperty:@"text background color"];
}

+(NSObject*)getLigatureObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"text ligature"]) {
        return obj;
    }
    return nil;
}

+(NSObject*)getKernObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"text ligature"]) {
        return obj;
    }
    return nil;
}

+(NSObject*)getStrikethroughStyleObject:(NSObject*)obj{
    return [self getUnderlineStyleObject:obj]; // Equivalent
}

+(NSObject*)getUnderlineStyleObject:(NSObject*)obj{
    if ([obj isKindOfClass:[NSArray class]]) {
        NSUInteger style = 0;
        for (NSString *string in (NSArray*)obj) {
            if ([string isKindOfClass:[NSString class]]) {
                style |= [NSAttributedString underlineStyleWithString:string];
            }
            else{
                [NSException raise:@"Bad strikethrough/underline array child type" format:@"Children of array must be of type NSString, not '%@'", string.class];
            }
        }
        return @(style);
    }
    else if ([obj isKindOfClass:[NSNumber class]]){
        if ([(NSNumber*)obj boolValue]) return @(NSUnderlineStyleSingle);
        else return @(NSUnderlineStyleNone);
    }
    else if ([obj isKindOfClass:[NSString class]]){
        return @([NSAttributedString underlineStyleWithString:(NSString*)obj]);
    }
    else {
        [NSException raise:@"Bad strikethrough/underline property type" format:@"Property must be of type NSString/NSArray/NSNumber, not '%@'", obj.class];
        return nil;
    }
}

+(NSObject*)getStrokeColorObject:(NSObject*)obj{
    return [UIColor colorWithObject:obj forProperty:@"text stroke color"];
}

+(NSObject*)getStrokeWidthObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"text ligature"]) {
        return obj;
    }
    return nil;
}

+(NSObject*)getShadowObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSDictionary class] forProperty:@"text shadow"]) {
        return [NSShadow shadowWithDictionary:(NSDictionary*)obj];
    }
    return nil;
}

+(NSObject*)getTextEffectObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSString class] forProperty:@"text effect"]) {
        if ([(NSString*)obj isEqualToString:@"letterpress"]) return NSTextEffectLetterpressStyle;
        else{
            [NSException raise:@"Unknown text effect" format:@"Text effect '%@' is not a valid text effect",(NSString*)obj];
        }
    }
    return nil;
}

//+(NSObject*)getAttachmentObject:(NSObject*)obj{
//
//}

+(NSObject*)getLinkObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSString class] forProperty:@"text link"]) {
        return obj;
    }
    return nil;
}

+(NSObject*)getBaselineOffsetObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"text baseline offset"]) {
        return obj;
    }
    return nil;
}

+(NSObject*)getUnderlineColorObject:(NSObject*)obj{
    return [UIColor colorWithObject:obj forProperty:@"text underline color"];
}

+(NSObject*)getStrikethroughColorObject:(NSObject*)obj{
    return [UIColor colorWithObject:obj forProperty:@"text strikethrough color"];
}

+(NSObject*)getObliquenessObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"text obliqueness"]) {
        return obj;
    }
    return nil;
}

+(NSObject*)getExpansionObject:(NSObject*)obj{
    if ([NSException assertObject:obj isKindOfClass:[NSNumber class] forProperty:@"text expansion"]) {
        return obj;
    }
    return nil;
}

//+(NSObject*)getWritingDirectionObject:(NSObject*)obj{
//
//}

//+(NSObject*)getVerticalGlyphFormObject:(NSObject*)obj{
//
//}

+(NSUnderlineStyle)underlineStyleWithString:(NSString*)string{
    if ([string isEqualToString:@"none"]) return NSUnderlineStyleNone;
    else if([string isEqualToString:@"single"]) return NSUnderlineStyleSingle;
    else if([string isEqualToString:@"thick"]) return NSUnderlineStyleThick;
    else if([string isEqualToString:@"double"]) return NSUnderlineStyleDouble;
    else if([string isEqualToString:@"solid"]) return NSUnderlinePatternSolid;
    else if([string isEqualToString:@"dot"]) return NSUnderlinePatternSolid;
    else if([string isEqualToString:@"dash"]) return NSUnderlinePatternDash;
    else if([string isEqualToString:@"dashDot"]) return NSUnderlinePatternDashDot;
    else if([string isEqualToString:@"dashDotDot"]) return NSUnderlinePatternDashDotDot;
    else if([string isEqualToString:@"byWord"]) return NSUnderlineByWord;
    else{
        [NSException raise:@"Bad underline/strikethrough style" format:@"Style '%@' is invalid for strikethrough/underline", string];
        return 0;
    }
}

@end
