#import "NSData+Extend.h"


@implementation NSData (Extend)
- (NSString *)toString {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString *)base64_encode {
    return [self base64EncodedStringWithOptions:0];
}
@end