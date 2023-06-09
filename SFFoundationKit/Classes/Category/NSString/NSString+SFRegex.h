//
//  NSString+SFRegex.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface NSString (SFRegex)

/** 是否为正确的地址*/
- (BOOL)isUrl;

/** 手机号正则验证*/
- (BOOL)isTelphoneNumber;

/// 是否为空, 空格也算为空
- (BOOL)isEmptyWithWhiteSpace;

@end

NS_ASSUME_NONNULL_END
