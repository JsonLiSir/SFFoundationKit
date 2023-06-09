//
//  NSString+SFURL.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SFURL)

/** 获取url里面的key-Value*/
- (NSDictionary *)sf_getUrlPathAndParams;

/// urlPath
- (NSString *)sf_getUrlPath;

/// params
- (NSDictionary *)sf_getParams;

/// schemaParams
- (NSDictionary *)sf_getSchemaParams;

/// url encode
- (NSString *)URLEncodedString;

- (NSURL *)urlScheme:(NSString *)scheme;

@end

NS_ASSUME_NONNULL_END
