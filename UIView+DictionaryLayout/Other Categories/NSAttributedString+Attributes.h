//
//  NSAttributedString+Attributes.h
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Attributes)

+(NSString*)stringForAttributeIdentifier:(NSString*)identifier;

+(NSObject*)getFontObject:(NSObject*)obj;
//+(NSObject*)getParagraphStyleObject:(NSObject*)obj;
+(NSObject*)getForegroundColorObject:(NSObject*)obj;
+(NSObject*)getBackgroundColorObject:(NSObject*)obj;
+(NSObject*)getLigatureObject:(NSObject*)obj;
+(NSObject*)getKernObject:(NSObject*)obj;
+(NSObject*)getStrikethroughStyleObject:(NSObject*)obj;
+(NSObject*)getUnderlineStyleObject:(NSObject*)obj;
+(NSObject*)getStrokeColorObject:(NSObject*)obj;
+(NSObject*)getStrokeWidthObject:(NSObject*)obj;
+(NSObject*)getShadowObject:(NSObject*)obj;
+(NSObject*)getTextEffectObject:(NSObject*)obj;
//+(NSObject*)getAttachmentObject:(NSObject*)obj;
+(NSObject*)getLinkObject:(NSObject*)obj;
+(NSObject*)getBaselineOffsetObject:(NSObject*)obj;
+(NSObject*)getUnderlineColorObject:(NSObject*)obj;
+(NSObject*)getStrikethroughColorObject:(NSObject*)obj;
+(NSObject*)getObliquenessObject:(NSObject*)obj;
+(NSObject*)getExpansionObject:(NSObject*)obj;
//+(NSObject*)getWritingDirectionObject:(NSObject*)obj;
//+(NSObject*)getVerticalGlyphFormObject:(NSObject*)obj;

@end
