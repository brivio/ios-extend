#import "UIScrollView+Extend.h"


@implementation UIScrollView (Extend)
- (void)setContentHeight:(CGFloat)height {
    CGSize size = self.contentSize;
    self.contentSize = CGSizeMake(size.width, height);
}

- (void)setContentWidth:(CGFloat)width {
    CGSize size = self.contentSize;
    self.contentSize = CGSizeMake(width, size.height);
}

- (void)goTop {
    self.contentOffset = CGPointMake(0, 0);
}

@end