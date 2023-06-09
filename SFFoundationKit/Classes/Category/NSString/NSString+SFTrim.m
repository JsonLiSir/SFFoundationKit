//
//  NSString+SFTrim.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSString+SFTrim.h"

inline BOOL SF_STRING_EMPTY(NSString *str) {
    return [str isKindOfClass:[NSNull class]] || !str || [str isEqualToString:@""] || [str isEqualToString:@"<null>"]||[str isEqualToString:@"null"];
}

@implementation NSString (SFTrim)

- (NSString *)limitStringWithMaxLength:(CGFloat)length {
    NSString *resultString = self;
    
    if (resultString.length > 0 && [resultString isKindOfClass:[NSString class]]) {
        CGFloat  character = 0;
        const char *chars = [resultString cStringUsingEncoding:NSUTF8StringEncoding];
        NSUInteger charLength = length;
        if (strlen(chars) <= charLength*3 +1) {//1个汉字或中文字符3个字节，1个英文1个字节（NSUTF8StringEncoding只适用于这个方法）
            return resultString;
        }
        //获取字数(字节数乘以2即可)
        for(int i=0; i< [resultString length];i++){
            int a = [resultString characterAtIndex:i];
            if( a >= 0x4e00 && a <= 0x9fa5){ //判断是否为中文
                character +=1;
            }else{
                if ((isalpha(a))||(isalnum(a))||isascii(a)) {
                    character+=0.5;
                }else{
                    character +=1;
                }
            }
            if (character > length) {//按字数截取
                if (character == length) {
                    resultString = [resultString substringToIndex:i+1];
                }else{
                    resultString = [resultString substringToIndex:i];
                }
                resultString = [resultString stringByAppendingString:@"..."];
                break;
            }
        }
    }
    return resultString;
}


- (NSAttributedString *)setLineHeight:(CGFloat)lineHeight {
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.maximumLineHeight = lineHeight;
    paragraphStyle.minimumLineHeight = lineHeight;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    return  [[NSAttributedString alloc] initWithString:self attributes:attributes];
}

- (UIColor *)toColor {
    if (self == nil) {
        return nil;
    }
    unsigned int hexInt = 0;
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:self];
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    // Create color object, specifying alpha as well
    UIColor *color = [UIColor colorWithRed:((CGFloat) ((hexInt & 0xFF0000) >> 16))/255
                                     green:((CGFloat) ((hexInt & 0xFF00) >> 8))/255
                                      blue:((CGFloat) (hexInt & 0xFF))/255
                                     alpha:1];
    
    return color;
}

+ (NSString *)reverseString:(NSString *)string {
    //直接调用reverse的对象方法的返回值就OK
    return [string reverse];
}

- (NSString *)reverse {
    //length 计算字符串的长度
    NSInteger length = self.length;
    
    ///取出一个字符串中的每一个字符
    unichar *buffer = calloc(length, sizeof(unichar));
    
    ///翻转字符串的长度
    [self getCharacters:buffer range:NSMakeRange(0, length)];
    
    for (NSInteger i = 0; i<length/2; i++) {
        unichar temp = buffer[i];
        buffer[i] = buffer[length-1-i];
        buffer[length-1-i] = temp;
    }
    ///得到翻转之后的字符串
    NSString *result = [NSString stringWithCharacters:buffer length:length];
    //释放对象
    free(buffer);
    return result;
}

/** 获取字节长度*/
- (NSInteger)convertToByte {
    int strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
       } else {
           p++;
       }
    }
    return (strlength+1)/2;
}

- (NSString *)calEndTime {
    if (self.length == 0) {
        return @"0小时0分钟";
    }
    
    // 1.将时间转换为date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    
    NSDate *date1 = [NSDate date];
    NSDate *date2 = [formatter dateFromString:self];
    // 2.创建日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitHour | NSCalendarUnitMinute;
    // 3.利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [calendar components:type fromDate:date1 toDate:date2 options:0];
    // 4.输出结果
    NSString *timeStr = [NSString stringWithFormat:@"%ld小时%ld分钟",cmps.hour, cmps.minute];
    
    if (cmps.hour < 0 || cmps.minute < 0) {
        return @"0小时0分钟";
    }
    
    return timeStr;
}
/**富文本字体
 *@param string 替换字体
 *@param color 替换的颜色
 *@param font 替换的字体大小
 */
- (NSMutableAttributedString *)stringWithString:(NSString *)string
                                          color:(UIColor *)color
                                           font:(UIFont *)font {
    
    //创建富文本
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    //分别获得想要改变字体颜色的range
    NSRange range = [self rangeOfString:string options:NSBackwardsSearch];
    //设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedStr.string.length)];
    //改变字体颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        
    return  attributedStr;
}

/**手机号脱敏
 */
- (NSString *)mobileDesensitization {
    if (SF_STRING_EMPTY(self) || self.length < 8) return self;
    return [self stringByReplacingCharactersInRange:NSMakeRange(self.length - 8, 4) withString:@"****"];//防止号码有前缀所以使用倒数第8位开始替换
}

@end
