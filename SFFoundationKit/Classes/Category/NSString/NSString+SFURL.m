//
//  NSString+SFURL.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSString+SFURL.h"
#import "NSString+SFTrim.h"

@implementation NSString (SFURL)

- (NSDictionary *)sf_getUrlPathAndParams {
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    // 查找参数
    if(SF_STRING_EMPTY(self)) return dict;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSRange range = [self rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        [dict setObject:self forKey:@"urlPath"];
        return dict;
    }else{
        // 截取参数
           NSString *parametersString = [self substringFromIndex:range.location + 1];
           NSString *url=[self substringToIndex:range.location];
           [dict setObject:url forKey:@"urlPath"];
           // 判断参数是单个参数还是多个参数
           if ([parametersString containsString:@"&"]) {
               // 多个参数，分割参数
               NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
               
               for (NSString *keyValuePair in urlComponents) {
                   // 生成Key/Value
                   NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
                   NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
                   NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
                   // Key不能为nil
                   if (SF_STRING_EMPTY(key) || SF_STRING_EMPTY(value)) {
                       continue;
                   }
                   [params setValue:value forKey:key];
               }
           } else {
               // 单个参数
               // 生成Key/Value
               NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
               // 只有一个参数，没有值
               if (pairComponents.count >1) {
                   // 分隔值
                   NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
                   NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
                   [params setValue:value forKey:key];
               }
            }
        [dict setObject:params forKey:@"params"];
    }
   return dict;
}

- (NSDictionary *)sf_getResultUrlPathAndParams {
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    // 查找参数
    if(SF_STRING_EMPTY(self)) return dict;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSRange range = [self rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        [dict setObject:self forKey:@"urlPath"];
        return dict;
    }else{
        // 截取参数
           NSString *parametersString = [self substringFromIndex:range.location + 1];
           NSString *url=[self substringToIndex:range.location];
           [dict setObject:url forKey:@"urlPath"];
           // 判断参数是单个参数还是多个参数
           if ([parametersString containsString:@"&"]) {
               // 多个参数，分割参数
               NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
               
               for (NSString *keyValuePair in urlComponents) {
                   // 生成Key/Value
                   NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
                   NSString *key = pairComponents.firstObject;
                   NSString *value = pairComponents.lastObject;
                   // Key不能为nil
                   if (SF_STRING_EMPTY(key) || SF_STRING_EMPTY(value)) {
                       continue;
                   }
                   [params setValue:value forKey:key];
               }
           } else {
               // 单个参数
               // 生成Key/Value
               NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
               // 只有一个参数，没有值
               if (pairComponents.count >1) {
                   // 分隔值
                   NSString *key = pairComponents.firstObject;
                   NSString *value = pairComponents.lastObject;
                   [params setValue:value forKey:key];
               }
            }
        [dict setObject:params forKey:@"params"];
    }
   return dict;
}

- (NSString *)sf_getUrlPath {
    return self.sf_getUrlPathAndParams[@"urlPath"];
}
- (NSDictionary *)sf_getParams {
    return self.sf_getUrlPathAndParams[@"params"];
}
- (NSDictionary *)sf_getSchemaParams {
    return self.sf_getResultUrlPathAndParams[@"params"];
}

- (NSString *)URLEncodedString {
    if (self.length == 0) {
        return @"";
    }
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    return encodedString;
}

- (NSURL *)urlScheme:(NSString *)scheme {
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:[NSURL URLWithString:self] resolvingAgainstBaseURL:NO];
    components.scheme = scheme;
    return [components URL];
}
@end
