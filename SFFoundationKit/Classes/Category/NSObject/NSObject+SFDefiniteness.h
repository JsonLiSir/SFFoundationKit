//
//  NSObject+SFDefiniteness.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 判断对象为空
FOUNDATION_EXTERN BOOL SF_OBJECT_IS_EMPTY(NSObject *objc);

/// 将对象转为字符串,若失败则返回空的(非nil)字符串
FOUNDATION_EXTERN NSString *SF_OBJECT_TO_SAFE_STRING(id object);

@interface NSObject (SFDefiniteness)
/**
 转化失败返回默认值0
 */
- (NSInteger)sf_int;

/**
 转化失败返回默认值0
 */
- (NSUInteger)sf_uInt;

/**
 转化失败返回默认值0.0
 */
- (CGFloat)sf_float;

/**
 转化失败返回默认值0.0
 */
- (double)sf_double;

/**
 转化失败返回默认值NO
 */
- (BOOL)sf_bool;

/**
 转化失败返回默认值nil
 */
- (NSString *)sf_string;

/**
 转化失败返回默认值nil
 */
- (NSArray *)sf_array;

/**
 转化失败返回默认值nil
 */
- (NSDictionary *)sf_dictionary;

/// 是字典类型且不为空
- (BOOL)sf_isDictionaryAndNotEmpty;

/// 是字符串类型且不为nil
- (BOOL)sf_isStringAndNotEmpty;

/// 是集合类型且不为空
- (BOOL)sf_isArrayAndNotEmpty;

@end

NS_ASSUME_NONNULL_END
