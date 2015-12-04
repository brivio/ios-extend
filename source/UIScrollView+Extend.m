#import "UIScrollView+Extend.h"


@implementation UIScrollView (Extend)
- (void)goTop {
    self.contentOffset = CGPointMake(0, 0);
}

@end