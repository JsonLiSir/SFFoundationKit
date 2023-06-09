//
//  NSAttributedString+SFBounding.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSAttributedString+SFBounding.h"

@implementation NSAttributedString (SFBounding)

- (CGSize)stringOfAttributedStringWidth:(CGFloat)width{
    if(self && self.length==0) return CGSizeZero;
    
    CGSize attSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    attSize = CGSizeMake(ceilf(attSize.width), ceilf(attSize.height));
    return attSize;
}
@end
