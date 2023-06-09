//
//  NSDictionary+SFExts.h
//  StarFish
//
//  Created by 李阳 on 2021/2/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SFExts)

/*****************获取升序键值*********************/
- (NSArray *)nk_ascendingComparedAllKeys;

/*****************获取降序键值*********************/
- (NSArray *)nk_descendingComparedAllKeys;

/*****************删除null值*********************/
- (NSDictionary *)deleteAllNullValue;

/// jsonString -> NSDictionary
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end

@interface NSMutableDictionary (SFExts)

@end


NS_ASSUME_NONNULL_END
