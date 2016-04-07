#import "NSMutableArray+Extend.h"


@implementation NSMutableArray (Extend)
- (void)push:(id)anObject {
    [self addObject:anObject];
}

- (void)removeFirstObject {
    if (self.count > 0) {
        [self removeObjectAtIndex:0];
    }
}

@end