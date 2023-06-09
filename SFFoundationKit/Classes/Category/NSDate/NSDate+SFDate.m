//
//  NSDate+SFDate.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSDate+SFDate.h"
#import "SFFoundationKitMacro.h"

inline long SF_CURRENT_TIME_STAMP() {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //设置时区,这个对于时间的处理有时很重要
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [formatter setTimeZone:timeZone];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    long timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] longValue];
    return timeSp;
}

/// 获得当前的年月日
inline NSString *SF_CURRENT_DATE() {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //设置时区,这个对于时间的处理有时很重要
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [formatter setTimeZone:timeZone];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    //获取当前时间日期展示字符串
    NSString *str = [formatter stringFromDate:date];
    return str;
}

inline NSString *SF_GET_DATE(NSDate *date) {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"MMddHHmmss"];/* */    //设定时间格式,这里可以设置成自己需要的格式
    NSString *dateString = [dateFormat stringFromDate:date];
    return dateString;
}

@implementation NSDate (SFDate)

@end
