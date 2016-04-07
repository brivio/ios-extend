#import "UIButton+Extend.h"


@implementation UIButton (Extend)
- (void)setTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setAttributedTitle:(NSAttributedString *)title {
    [self setAttributedTitle:title forState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (void)setTitleSize:(CGFloat)size {
    self.titleLabel.font = [UIFont systemFontOfSize:size];
}

- (void)setImage:(NSString *)name {
    [self setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
}

- (void)setBackgroundImage:(NSString *)name {
    if (name == nil) {
        self.layer.contents = nil;
    } else {
        self.layer.contents = (id) [UIImage imageNamed:name].CGImage;
        self.layer.contentsGravity = kCAGravityResizeAspect;
    }
}

@end