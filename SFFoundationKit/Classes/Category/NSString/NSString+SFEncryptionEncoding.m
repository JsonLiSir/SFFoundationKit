//
//  NSString+SFEncryptionEncoding.m
//  StarFish
//
//  Created by 李阳 on 2021/2/4.
//

#import "NSString+SFEncryptionEncoding.h"
#import<CommonCrypto/CommonDigest.h>

@implementation NSString (SFEncryptionEncoding)

- (NSString *)md5 {
    const char *str = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( str, (CC_LONG)strlen(str), digest );
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

//大写
- (NSString*)md532BitUpper {
    const char *cStr = [self UTF8String];
    unsigned char result[16];

    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]] uppercaseString];
}

/** sha1Base64编码*/
+ (NSString *)sha1_base64:(NSString *)string {
    NSData *data=[string dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (int)data.length, digest);
    
    NSData * base64 = [[NSData alloc]initWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    base64 = [base64 base64EncodedDataWithOptions:0];;
    
    NSString * output = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
    NSRange index=[output rangeOfString:@"="];
    if(index.location!=NSNotFound)
    {
        output=[output substringToIndex:index.location];
    }
    output=[output stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    output=[output stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return output;
}

@end

