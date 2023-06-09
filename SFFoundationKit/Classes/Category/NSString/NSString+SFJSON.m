//
//  NSString+SFJSON.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSString+SFJSON.h"
#import "NSString+SFTrim.h"

@implementation NSString (SFJSON)

- (id)sf_jsonSerialization {
    NSError *error;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    id obj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    return error ? nil : obj;
}

@end
