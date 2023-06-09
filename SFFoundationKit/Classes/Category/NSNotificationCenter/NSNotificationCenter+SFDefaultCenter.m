//
//  NSDate+SFDate.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSNotificationCenter+SFDefaultCenter.h"

/**  发通知 */
inline void SF_POST_NOTIFICATION (NSString *key){
    [[NSNotificationCenter defaultCenter]postNotificationName:key object:nil];

}
/**  接通知 */
inline void SF_ADD_NOTIFICATION ( id observer , SEL selector,NSString *key){
    [[NSNotificationCenter defaultCenter]addObserver:observer selector:selector name:key object:nil];
}

@implementation NSNotificationCenter (SFDefaultCenter)


@end
