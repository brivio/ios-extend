#import "UIScrollView+Extend.h"
#import "UIView+Extend.h"

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

- (void)goBottom {
    CGPoint bottomOffset = CGPointMake(0, self.contentSize.height);
    [self setContentOffset:bottomOffset animated:YES];
}

- (void)fitContent {
    [self fitContent:0];
}

- (void)fitContent:(CGFloat)offset {
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    CGSize size = contentRect.size;
    size.height += offset;
    self.contentSize = size;
}

@end