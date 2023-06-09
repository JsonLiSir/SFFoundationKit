//
//  NSString+SFBounding.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSString+SFBounding.h"
#import "NSString+SFTrim.h"

@implementation NSString (SFBounding)

- (CGFloat)getHeightLineSpacing:(CGFloat)lineSpacing
                font:(UIFont*)font
               width:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = lineSpacing;
    NSDictionary *dic = @{ NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return  ceilf(size.height);
}

- (CGSize)stringOfCustomFont:(UIFont *)font aWidth:(CGFloat)width {
    if(SF_STRING_EMPTY(self)) {
        return CGSizeZero;;
    }
    CGRect stringRect=[self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    CGSize strSize=stringRect.size;
    strSize=CGSizeMake(ceilf(strSize.width), ceilf(strSize.height));
    return strSize;
}

//定宽 算占有高
- (CGSize)stringOfSystemFond:(CGFloat)fond aWidth:(CGFloat)width {
    if(SF_STRING_EMPTY(self)) {
        return CGSizeZero;;
    }
    CGRect stringRect=[self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fond]} context:nil];
    CGSize strSize=stringRect.size;
    strSize=CGSizeMake(ceilf(strSize.width), ceilf(strSize.height));
    return strSize;
}

- (CGSize)sizeWithmaxSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [self length])];
    CGSize realSize = CGSizeZero;
    CGRect textRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil];
    realSize = textRect.size;
    realSize.width = ceilf(realSize.width);
    realSize.height = ceilf(realSize.height);
    return realSize;
}

@end
