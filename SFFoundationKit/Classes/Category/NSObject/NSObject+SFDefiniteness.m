//
//  NSObject+SFDefiniteness.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSObject+SFDefiniteness.h"

/**  判断对象为空 */
inline BOOL SF_OBJECT_IS_EMPTY(NSObject *objc) {
    if (!objc)                                 return YES;
    if (objc == nil)                          return YES;
    if ([objc isKindOfClass:[NSNull class]])  return YES;
    if ([objc isEqual:@"<null>"])             return YES;
    if ([objc isEqual:@""])                   return YES;
    if ([objc isEqual:@"null"])               return YES;
    if ([objc isEqual:@"(null)"])             return YES;
    return NO;
}

/**  转字符串 */
inline NSString *SF_OBJECT_TO_SAFE_STRING(id object) {
    return [object sf_string] ?: @"";
}


@implementation NSObject (SFDefiniteness)

- (NSInteger)sf_int {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self integerValue];
    }
    
    NSInteger result;
    @try {
        result = [[NSString stringWithFormat:@"%@", self] integerValue];
    }
    @catch (NSException *exception) {
        result = 0;
    }
    
    return result;
}

- (NSUInteger)sf_uInt {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self unsignedIntegerValue];
    }
    
    NSUInteger result;
    @try {
        result = [[NSString stringWithFormat:@"%@", self] integerValue];
    }
    @catch (NSException *exception) {
        result = 0;
    }
    
    return result;
}

- (CGFloat)sf_float {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self floatValue];
    }
    
    CGFloat result;
    @try {
        result = [[NSString stringWithFormat:@"%@", self] floatValue];
    }
    @catch (NSException *exception) {
        result = 0.0f;
    }
    
    return result;
}

- (double)sf_double {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self doubleValue];
    }
    
    double result;
    @try {
        result = [[NSString stringWithFormat:@"%@", self] doubleValue];
    }
    @catch (NSException *exception) {
        result = 0.0f;
    }
    
    return result;
}

- (BOOL)sf_bool {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self boolValue];
    } else if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self caseInsensitiveCompare:@"null"] == NSOrderedSame) {
            return NO;
        }
    } else if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    return self != nil;
}

- (NSString *)sf_string {
    if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self caseInsensitiveCompare:@"null"] == NSOrderedSame) {
            return nil;
        }
        else {
            return (NSString *)self;
        }
    }
    
    NSString *result;
    @try {
        if (self == nil || [self isKindOfClass:[NSNull class]]) {
            result = nil;
        }
        else {
            result = [NSString stringWithFormat:@"%@", self];
        }
    }
    @catch (NSException *exception) {
        result = nil;
    }
    
    return result;
}

- (NSArray *)sf_array {
    return [self isKindOfClass:[NSArray class]] ? (NSArray *)self : nil;
}

- (NSDictionary *)sf_dictionary {
    return [self isKindOfClass:[NSDictionary class]] ? (NSDictionary *)self : nil;
}


- (BOOL)sf_isDictionaryAndNotEmpty {
    NSDictionary *dic = (NSDictionary *)self;
    return [dic isKindOfClass:[NSDictionary class]] && dic.count > 0;
}
- (BOOL)sf_isStringAndNotEmpty {
    NSString *str = (NSString *)self;
    return [str isKindOfClass:[NSString class]] && str.length > 0;
}
- (BOOL)sf_isArrayAndNotEmpty {
    NSArray *arr = (NSArray *)self;
    return [arr isKindOfClass:[NSArray class]] && arr.count > 0;
}
@end
