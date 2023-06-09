//
//  NSArray+SFSafe.h
//  SFFoundationKit
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (SFSafe)

- (ObjectType)sf_safeObjectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray (SFSafe)

- (void)sf_safeAddObject:(id)anObject;
- (void)sf_safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
