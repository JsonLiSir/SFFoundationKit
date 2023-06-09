//
//  NSURL+SFExts.m
//  StarFish
//
//  Created by 李阳 on 2021/2/4.
//

#import "NSURL+SFExts.h"
#import <objc/runtime.h>

@implementation NSURL (SFExts)

+ (void)load {
    // 获取imageName:方法的地址
    Method URLWithStringMethod = class_getClassMethod(self, @selector(URLWithString:));
    
    // 获取sc_imageWithName:方法的地址
    Method sc_URLWithStringMethod = class_getClassMethod(self, @selector(sc_URLWithString:));
    
    // 交换方法地址，相当于交换实现方式2
    method_exchangeImplementations(URLWithStringMethod, sc_URLWithStringMethod);
}


+ (NSURL *)sc_URLWithString:(NSString *)URLString {
    
    NSString *newURLString = [self IsChinese:URLString];
    return [NSURL sc_URLWithString:newURLString];
}

//判断是否有中文
+ (NSString *)IsChinese:(NSString *)str {
    NSString *newString = str;
    
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)//中文
        {
            NSString *oldString = [str substringWithRange:NSMakeRange(i, 1)];
            NSString *string = [oldString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            newString = [newString stringByReplacingOccurrencesOfString:oldString withString:string];
        } else{
            
        }
    }
    return newString;
}

@end
