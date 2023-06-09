//
//  NSArray+SFExts.h
//  StarFish
//
//  Created by 李阳 on 2021/3/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SFExts)

- (NSString *)toJSONString;

/// 是否为空数组
- (BOOL)isArrayEmpty;

@end

NS_ASSUME_NONNULL_END
