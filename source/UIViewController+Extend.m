#import "UIViewController+Extend.h"

@implementation UIViewController (Extend)
- (UIView *)topView {
    UIViewController *recentView = self;
    while (recentView.parentViewController != nil) {
        recentView = recentView.parentViewController;
    }
    return recentView.view;
}

@end