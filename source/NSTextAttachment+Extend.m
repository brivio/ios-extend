#import "NSTextAttachment+Extend.h"

@implementation NSTextAttachment (Extend)
- (void)adjustY:(CGFloat)y {
    self.bounds = CGRectMake(0, y, self.image.size.width, self.image.size.height);
}
@end