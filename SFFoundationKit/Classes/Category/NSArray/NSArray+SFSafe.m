//
//  NSArray+SFSafe.m
//  SFFoundationKit
//

#import "NSArray+SFSafe.h"

@implementation NSArray (SFSafe)

- (id)sf_safeObjectAtIndex:(NSUInteger)index {
    return index < self.count ? [self objectAtIndex:index] : nil;
}

@end

@implementation NSMutableArray (SFSafe)

- (void)sf_safeAddObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)sf_safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject || index < 0) {
        return;
    }
    if (index == self.count) {
        [self addObject:anObject];
    } else if (index < self.count) {
        [self insertObject:anObject atIndex:index];
    }
}

@end
