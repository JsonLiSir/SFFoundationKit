//
//  SFThreadUtil.m
//  StarFish
//
//  Created by 李阳 on 2021/2/23.
//

#import "SFThreadUtil.h"
 
@interface SFThreadUtil ()

@property (nonatomic, strong) dispatch_source_t timer;//  注意:此处应该使用强引用strong

@property (nonatomic, assign) NSInteger num;

@end

@implementation SFThreadUtil
/** 异步延时 */
+ (void)asynCall:(int)delayMillis fun:(void(^)(void))fun{
    if (delayMillis > 0) {
        double span = (double)(delayMillis/1000.0);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(span * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if(fun) fun();
        });
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(fun) fun();
        });
    }
}

/** 默认时间异步 */
+ (void)asynCall:(void(^)(void))fun{
    [self asynCall:10 fun:^{
        if(fun) fun();
    }];
}

/** 默认时间同步 */
+ (void)mainCall:(void(^)(void))fun{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(fun) fun();
    });
}

/** 全局队列异步执行*/
+ (void)asynGolbalCall:(void(^)(void))fun {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_async(globalQueue, ^{
        fun();
    });
}

#pragma mark =============== 定时器 =================
- (void)startTimer:(NSInteger)timer Call:(void(^)(void))fun {
    [self stopTimer];
    dispatch_queue_t queue = dispatch_get_main_queue();
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, timer * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        if(fun) fun();
    });
    dispatch_resume(self.timer);
}
- (void)startTimerWithEndTime:(NSInteger)timer Call:(void(^)(NSInteger code,NSInteger residueTime))fun {
    [self stopTimer];
    __block NSInteger time = timer;
    dispatch_queue_t queue = dispatch_get_main_queue();
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        time --;
        if (time <= 0) {
            [self stopTimer];
            if(fun) fun(0,0);
        }else {
            if(fun) fun(1,time);
        }
    });
    dispatch_resume(self.timer);
}
- (void)stopTimer {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
}

@end
