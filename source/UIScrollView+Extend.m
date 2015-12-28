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

- (void)fitContent {
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    self.contentSize = contentRect.size;
}

@end