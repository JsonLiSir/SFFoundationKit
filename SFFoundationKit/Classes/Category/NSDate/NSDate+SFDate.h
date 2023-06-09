//
//  NSDate+SFDate.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>

/// 获得当前的时间戳
FOUNDATION_EXTERN long SF_CURRENT_TIME_STAMP(void);

/// 获得当前的年月日
FOUNDATION_EXTERN NSString *SF_CURRENT_DATE(void);

/// 获得指定的格式的(MddHHmmss)时间字符串
FOUNDATION_EXTERN NSString *SF_GET_DATE(NSDate *date);

@interface NSDate (SFDate)


@end
