//
//  NSString+SFEncryptionEncoding.h
//  StarFish
//
//  Created by 李阳 on 2021/2/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SFEncryptionEncoding)

/** md5编码*/
- (NSString *)md5;


/** 大写*/
- (NSString*)md532BitUpper;

/** sha1Base64编码*/
+ (NSString *)sha1_base64:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
