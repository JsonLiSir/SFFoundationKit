//
//  NSString+SFTransformDate.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSString+SFTransformDate.h"
#import "NSString+SFTrim.h"

@implementation NSString (SFTransformDate)

- (NSString *)stringFormatDate {
    if (SF_STRING_EMPTY(self)) return @"";
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    // 设置日期格式(为了转换成功)
    [fmt setDateFormat :@"yyyy-MM-dd HH:mm:ss" ];
    NSDate *answerDate=[fmt dateFromString:self];
    [fmt setDateFormat:@"yyyy-MM-dd" ];
    
    return [fmt stringFromDate:answerDate];
}

@end
