//
//  NSObject+SFDefiniteness.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN BOOL SF_OverrideImplementation(Class cls, SEL sel, id(^implBlock)(Class originCls, SEL originSel, IMP originImp));

@interface NSObject (SFSwizzle)

+ (BOOL)sf_swizzleInstanceMethod:(SEL)originalSel with:(SEL)swizzleSel;
+ (BOOL)sf_swizzleClassMethod:(SEL)originalSel with:(SEL)swizzleSel;

+ (BOOL)sf_swizzleAddMethod:(SEL)addSel fromClass:(Class)implCls method:(SEL)implSel;

@end

NS_ASSUME_NONNULL_END
