//
//  NSString+SFBounding.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (SFBounding)

/**
 获取字符串的高度

 @param lineSpacing 行间距
 @param font 字体大小
 @param width 控件宽度
 @return 高度
 */
- (CGFloat)getHeightLineSpacing:(CGFloat)lineSpacing
                font:(UIFont*)font
               width:(CGFloat)width;

/**
 获取字符串的宽高度
 @param font 字体大小
 @param width 控件宽度
 */
- (CGSize)stringOfCustomFont:(UIFont *)font aWidth:(CGFloat)width;

#pragma mark-once 获取文字高度
- (CGSize)sizeWithmaxSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;

//定宽 算占有高
- (CGSize)stringOfSystemFond:(CGFloat)fond aWidth:(CGFloat)width;


@end

NS_ASSUME_NONNULL_END
