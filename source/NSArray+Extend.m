#import "NSArray+Extend.h"


@implementation NSArray (Extend)
- (NSString *)implode:(NSString *)separator {
    return [NSString stringWithFormat:@"%@", [self componentsJoinedByString:separator]];
}

- (id)reverse {
    return [[self reverseObjectEnumerator] allObjects];
}

@end