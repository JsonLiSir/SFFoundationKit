//
//  NSArray+SFExts.m
//  StarFish
//
//  Created by 李阳 on 2021/3/18.
//

#import "NSArray+SFExts.h"

@implementation NSArray (SFExts)

- (NSString *)toJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                     error:nil];
    
    if (data == nil) {
        return @"";
    }
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}

- (BOOL)isArrayEmpty {
    if(self==nil||[self isKindOfClass:[NSNull class]]) {
       return YES;
   }else if(self.count < 1) {
       return YES;
   }else{
       return NO;
   }
}

@end
