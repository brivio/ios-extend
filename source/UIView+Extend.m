#import "MBProgressHUD.h"

@implementation UIView (Extend)
- (void)setBorderWidth:(CGFloat)width {
    self.layer.borderWidth = width;
}

- (void)setBorderColor:(UIColor *)color {
    self.layer.borderColor = [color CGColor];
}

- (void)setBorderRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void)setBorder:(CGFloat)radius color:(UIColor *)color {
    [self setBorderColor:color];
    [self setBorderWidth:1];
    [self setBorderRadius:radius];
}

- (CGFloat)getWidth {
    return self.frame.size.width;
}

- (CGFloat)getHeight {
    return self.frame.size.height;
}

- (CGFloat)getX {
    return self.frame.origin.x;
}

- (CGFloat)getY {
    return self.frame.origin.y;
}

- (void)makeRound {
    CGFloat length = [self getWidth] > [self getHeight] ? [self getHeight] : [self getWidth];
    [self setBorderRadius:length / 2];
}

- (void)click:(id)target action:(SEL)action {
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
}

- (void)empty {
    for (NSUInteger i = 0; i < self.subviews.count; i++) {
        [((UIView *) self.subviews[i]) removeFromSuperview];
    }
}

- (void)setCorner:(UIRectCorner)corners size:(CGFloat)size {
    [self setBorderRadius:0];
    UIBezierPath *maskPath = [UIBezierPath
            bezierPathWithRoundedRect:self.bounds
                    byRoundingCorners:corners
                          cornerRadii:CGSizeMake(size, size)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)showHUD:(NSString *)title {
    [self showHUD:title callback:nil];
}

- (void)showHUD:(NSString *)title callback:(MBProgressHUDCompletionBlock)callback {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    hud.labelText = title;
    hud.mode = MBProgressHUDModeCustomView;
    [self addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:1];
    hud.completionBlock = callback;
}

- (UIViewController *)viewController {
    UIResponder *nextResponder = self;

    do {
        nextResponder = [nextResponder nextResponder];

        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController *) nextResponder;

    } while (nextResponder != nil);

    return nil;
}
@end
