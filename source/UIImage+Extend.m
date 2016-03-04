#import "UIImage+Extend.h"

@implementation UIImage (Extend)
+ (UIImage *)load:(NSString *)url {
    if (url == nil)return nil;
    NSData *data = [[NSData alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:url]];
    return [[UIImage alloc] initWithData:data];
}
@end