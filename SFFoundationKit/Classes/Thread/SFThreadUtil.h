//
//  SFThreadUtil.h
//  StarFish
//
//  Created by 李阳 on 2021/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFThreadUtil : NSObject

/** 异步延时 */
+ (void)asynCall:(int)delayMillis fun:(void(^)(void))fun;

/** 默认时间异步 */
+ (void)asynCall:(void(^)(void))fun;

/** 默认时间同步 */
+ (void)mainCall:(void(^)(void))fun;

/** 全局队列异步执行*/
+ (void)asynGolbalCall:(void(^)(void))fun;
#pragma mark =============== 定时器 =================
/** 轮循-不停止*/
- (void)startTimer:(NSInteger)timer Call:(void(^)(void))fun;
/** 倒计时结束会停止*/
- (void)startTimerWithEndTime:(NSInteger)timer Call:(void(^)(NSInteger code,NSInteger residueTime))fun;
- (void)stopTimer;

@end

NS_ASSUME_NONNULL_END
