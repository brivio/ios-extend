#import "UIImage+Extend.h"

@implementation UIImage (Extend)
+ (UIImage *)load:(NSString *)url {
    NSData *data = [[NSData alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:url]];
    return [[UIImage alloc] initWithData:data];
}
@end