//
//  NSString+SFTransformDate.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SFTransformDate)

/**yyyy-MM-dd HH:mm:ss ---> yyyy-MM-dd*/
- (NSString *)stringFormatDate;

@end

NS_ASSUME_NONNULL_END
