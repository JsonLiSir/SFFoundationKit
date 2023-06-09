//
//  NSDate+SFDate.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

/**  发通知 */
FOUNDATION_EXTERN void SF_POST_NOTIFICATION (NSString *key);

/**  接通知 */
FOUNDATION_EXTERN void SF_ADD_NOTIFICATION (id observer,SEL selector,NSString *key);

@interface NSNotificationCenter (SFDefaultCenter)


@end

NS_ASSUME_NONNULL_END
