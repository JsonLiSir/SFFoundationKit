//
//  NSString+SFTrim.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 判断字符串是否为空
FOUNDATION_EXTERN BOOL SF_STRING_EMPTY(NSString *str);

@interface NSString (SFTrim)

//1.字符串设置长度，长度限制----字符串（目的：超过length时，后面显示...代码如下）
- (NSString *)limitStringWithMaxLength:(CGFloat)length;

/** 设置行高*/
- (NSAttributedString *)setLineHeight:(CGFloat)lineHeight;

/** 16进制字符串转颜色*/
- (UIColor *)toColor;

/** 获取字节长度*/
- (NSInteger)convertToByte;

/** 字符串翻转*/
+ (NSString *)reverseString:(NSString *)string;

// eg: 20小时10分钟
- (NSString *)calEndTime;



/**富文本字体
 *@param string 替换字体
 *@param color 替换的颜色
 *@param font 替换的字体大小
 */
- (NSMutableAttributedString *)stringWithString:(NSString *)string
                                          color:(UIColor *)color
                                           font:(UIFont *)font;

/**手机号脱敏
 */
- (NSString *)mobileDesensitization;

@end

NS_ASSUME_NONNULL_END
