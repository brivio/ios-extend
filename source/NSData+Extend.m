#import "NSData+Extend.h"


@implementation NSData (Extend)
- (NSString *)toString {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end