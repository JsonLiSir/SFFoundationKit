//
//  NSObject+SFDefiniteness.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#import "NSObject+SFSwizzle.h"

#import <objc/runtime.h>

inline BOOL SF_OverrideImplementation(Class targetClass, SEL targetSelector, id (^implementationBlock)(Class originClass, SEL originCMD, IMP originIMP)) {
    Method originMethod = class_getInstanceMethod(targetClass, targetSelector);
    if (!originMethod) {
        return NO;
    }
    IMP originIMP = method_getImplementation(originMethod);
    method_setImplementation(originMethod, imp_implementationWithBlock(implementationBlock(targetClass, targetSelector, originIMP)));
    return YES;
}

@implementation NSObject (TYSwizzle)

+ (BOOL)sf_swizzleInstanceMethod:(SEL)oriSel with:(SEL)swiSel {
    Method oriMethod = class_getInstanceMethod(self, oriSel);
    Method swiMethod = class_getInstanceMethod(self, swiSel);
    if (!oriMethod || !swiMethod) return NO;
    
    class_addMethod(self,
                    oriSel,
                    class_getMethodImplementation(self, oriSel),
                    method_getTypeEncoding(oriMethod));
    class_addMethod(self,
                    swiSel,
                    class_getMethodImplementation(self, swiSel),
                    method_getTypeEncoding(swiMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, oriSel),
                                   class_getInstanceMethod(self, swiSel));
    return YES;
}

+ (BOOL)sf_swizzleClassMethod:(SEL)oriSel with:(SEL)swiSel {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, oriSel);
    Method newMethod = class_getInstanceMethod(class, swiSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

+ (BOOL)sf_swizzleAddMethod:(SEL)addSel fromClass:(Class)implCls method:(SEL)implSel {
    return class_addMethod(self, addSel,
                           class_getMethodImplementation(implCls, implSel),
                           method_getTypeEncoding(class_getInstanceMethod(implCls, implSel)));
}

@end
