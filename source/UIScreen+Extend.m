#import "UIScreen+Extend.h"

@implementation UIScreen (Extend)
+ (CGFloat)width {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)height {
    return [UIScreen mainScreen].bounds.size.height;
}
@end