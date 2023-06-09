//
//  NSAttributedString+SFBounding.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (SFBounding)

- (CGSize)stringOfAttributedStringWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
