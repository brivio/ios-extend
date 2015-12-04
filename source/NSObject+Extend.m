#import "NSObject+Extend.h"


@implementation NSObject (Extend)
+ (NSString *)className {
    return [[self class] description];
}

- (NSString *)toString {
    return [NSString stringWithFormat:@"%@", self];
}

@end