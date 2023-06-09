//
//  NSString+SFJSON.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SFJSON)

/**  字符串转json  **/
- (id)sf_jsonSerialization;

@end

NS_ASSUME_NONNULL_END
