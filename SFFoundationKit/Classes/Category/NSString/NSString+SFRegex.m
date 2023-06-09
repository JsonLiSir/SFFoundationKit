//
//  NSString+SFRegex.m
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSString+SFRegex.h"
#import "NSString+SFTrim.h"

@implementation NSString (SFRegex)

- (BOOL)isUrl {
    if(SF_STRING_EMPTY(self)) {
        return NO;
    }
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
        NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

- (BOOL)isTelphoneNumber {
    
    NSString *resultString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([resultString length] != 11) {
        return NO;
    }
    
    /**
     * 中国移动：China Mobile
     *13[4-9],147,148,15[0-2,7-9],165,170[3,5,6],172,178,18[2-4,7-8],19[5,7,8]
     */
    NSString *CM_NUM = @"^((13[4-9])|(14[7-8])|(15[0-2,7-9])|(165)|(178)|(18[2-4,7-8])|(19[5,7,8]))\\d{8}|(170[3,5,6])\\d{7}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,146,155,156,166,167,170[4,7,8,9],171,175,176,185,186,196
     */
    NSString *CU_NUM = @"^((13[0-2])|(14[5,6])|(15[5-6])|(16[6-7])|(17[1,5,6])|(18[5,6])|(196))\\d{8}|(170[4,7-9])\\d{7}$";
    
    /**
     * 中国电信：China Telecom
     * 133,149,153,162,170[0,1,2],173,174[0-5],177,180,181,189,19[0,1,3,9]
     */
    NSString *CT_NUM = @"^((133)|(149)|(153)|(162)|(17[3,7])|(18[0,1,9])|(19[0,1,3,9]))\\d{8}|((170[0-2])|(174[0-5]))\\d{7}$";

    /**
     * 中国广电：China Broadcasting Network
     * 192
     */
    NSString *CBN_NUM = @"^((192))\\d{8}$";
    
    NSPredicate *pred_CM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM_NUM];
    NSPredicate *pred_CU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU_NUM];
    NSPredicate *pred_CT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT_NUM];
    NSPredicate *pred_CBN = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CBN_NUM];
    BOOL isMatch_CM = [pred_CM evaluateWithObject:resultString];
    BOOL isMatch_CU = [pred_CU evaluateWithObject:resultString];
    BOOL isMatch_CT = [pred_CT evaluateWithObject:resultString];
    BOOL isMatch_CBN = [pred_CBN evaluateWithObject:resultString];
    if (isMatch_CM || isMatch_CT || isMatch_CU || isMatch_CBN) {
        return YES;
    }
    return NO;
}

- (BOOL)isEmptyWithWhiteSpace {
    if (![self isKindOfClass:NSString.class]) {
        return YES;
    }
    
    BOOL result = NO;
    NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimedString length] == 0) {
        result = YES;
    }
    
    return result;
}

@end
