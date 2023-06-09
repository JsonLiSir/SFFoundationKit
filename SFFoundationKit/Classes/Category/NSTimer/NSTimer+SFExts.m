//
//  NSTimer+SFExts.m
//  StarFish
//
//  Created by 李阳 on 2021/3/11.
//

#import "NSTimer+SFExts.h"

@implementation NSTimer (SFExts)

+ (NSTimer *)ZH_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(NSTimer *timer))block{
    return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(ZH_blcokInvoke:) userInfo:[block copy] repeats:repeats];
}
+ (void)ZH_blcokInvoke:(NSTimer *)timer {
    void (^block)(NSTimer *timer) = timer.userInfo;
    if (block) block(timer);
}
@end
