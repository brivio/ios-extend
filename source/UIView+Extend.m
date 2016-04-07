#import "MBProgressHUD.h"
#import "UITextView+Placeholder.h"
#import "common.h"
#import "View+MASAdditions.h"
#import "UIView+Extend.h"

PROPERTY(UIView, UIView*, simpleLoadingView);

PROPERTY(UIView, MBProgressHUD*, hud);

@implementation UIView (Extend)
- (void)resizeToFitSubviews {
    float w = 0;
    float h = 0;

    for (UIView *v in [self subviews]) {
        float fw = v.frame.origin.x + v.frame.size.width;
        float fh = v.frame.origin.y + v.frame.size.height;
        w = MAX(fw, w);
        h = MAX(fh, h);
    }
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, w, h)];
}

- (CGFloat)getSubviewsHeight {
    NSLayoutConstraint *tempConstraint = [NSLayoutConstraint
            constraintWithItem:self
                     attribute:NSLayoutAttributeWidth
                     relatedBy:NSLayoutRelationEqual
                        toItem:nil
                     attribute:NSLayoutAttributeNotAnAttribute
                    multiplier:1
                      constant:[self getWidth]];
    [self.superview addConstraint:tempConstraint];
    CGSize size = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    [self.superview removeConstraint:tempConstraint];
    return size.height;
}

- (void)showLoading {
    if (self.simpleLoadingView != nil) {
        [self.simpleLoadingView removeFromSuperview];
    }
    [self setsimpleLoadingView:[[UIView alloc] initWithFrame:self.bounds]];
    [self addSubview:self.simpleLoadingView];
    self.simpleLoadingView.backgroundColor = [UIColor whiteColor];

    UIActivityIndicatorView *loading = [UIActivityIndicatorView new];
    loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [loading startAnimating];
    [self.simpleLoadingView addSubview:loading];
    [loading mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.simpleLoadingView);
    }];
}

- (void)hideLoading {
    if (self.simpleLoadingView != nil) {
        [self.simpleLoadingView removeFromSuperview];
    }
}

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
    if ([self isKindOfClass:[UIButton class]]) {
        [((UIButton *) self) addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    } else {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    }
}

- (BOOL)isTap:(UITapGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationInView:self];
    CGPoint framePoint = CGPointMake(point.x + CGRectGetMinX(self.frame), point.y + CGRectGetMinY(self.frame));

    return CGRectGetMinX(self.frame) <= framePoint.x
            && framePoint.x <= CGRectGetMaxX(self.frame)
            && CGRectGetMinY(self.frame) <= framePoint.y
            && framePoint.y <= CGRectGetMaxY(self.frame);
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

- (void)showQuickHUD:(NSString *)title {
    [self showQuickHUD:title callback:nil];
}

- (void)showQuickHUD:(NSString *)title callback:(MBProgressHUDCompletionBlock)callback {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    hud.labelText = title;
    hud.mode = MBProgressHUDModeCustomView;
    [self addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:1.5];
    hud.completionBlock = callback;
}

- (void)showProgressHUD {
    [self showProgressHUD:nil];
}

- (void)showProgressHUD:(NSString *)title {
    [self showProgressHUD:title callback:nil];
}

- (void)showProgressHUD:(NSString *)title callback:(MBProgressHUDCompletionBlock)callback {
    [self hideProgressHUD];
    [self sethud:[[MBProgressHUD alloc] initWithView:self]];
    self.hud.labelText = title;
    self.hud.mode = MBProgressHUDModeIndeterminate;
    [self addSubview:self.hud];
    [self.hud show:YES];
    self.hud.completionBlock = callback;
}

- (void)hideProgressHUD {
    if (self.hud != nil) {
        [self.hud hide:YES];
    }
}

- (UIViewController *)viewController {
    UIResponder *nextResponder = self;
    id result;
    do {
        nextResponder = [nextResponder nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController *) nextResponder;
    } while (nextResponder != nil);

    return nil;
}

- (void)setFrameY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setFrameX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setFrameWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setFrameHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)frameX {
    return self.frame.origin.x;
}

- (CGFloat)frameY {
    return self.frame.origin.y;
}

- (CGFloat)frameWidth {
    return self.frame.size.width;
}

- (CGFloat)frameHeight {
    return self.frame.size.height;
}

- (void)_disableEdit:(UIView *)view {
    [view.subviews enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
        if ([v isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *) v;
            tf.enabled = NO;
            tf.placeholder = @"";
        } else if ([v isKindOfClass:[UITextView class]]) {
            UITextView *tv = (UITextView *) v;
            tv.editable = NO;
            tv.placeholder = @"";
        } else {
            [self _disableEdit:v];
        }
    }];
}

- (void)disableEdit {
    [self _disableEdit:self];
}

- (void)setTopBorder:(UIColor *)color {
    [self setTopBorder:color height:1];
}

- (void)setTopBorder:(UIColor *)color height:(CGFloat)height {
    UIView *line = [UIView new];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.mas_equalTo(height);
        make.top.equalTo(self.mas_top);
    }];
    line.backgroundColor = color;
}

- (void)toFront {
    [self.superview bringSubviewToFront:self];
}

- (void)toBack {
    [self.superview sendSubviewToBack:self];
}

@end
