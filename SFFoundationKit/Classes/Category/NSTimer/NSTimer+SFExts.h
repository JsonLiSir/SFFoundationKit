//
//  NSTimer+SFExts.h
//  StarFish
//
//  Created by 李阳 on 2021/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (SFExts)

+ (NSTimer *)ZH_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                        repeats:(BOOL)repeats
                                          block:(void(^)(NSTimer *timer))block;

@end

NS_ASSUME_NONNULL_END
