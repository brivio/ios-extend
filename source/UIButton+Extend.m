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

- (void)setImage:(NSString *)name {
    [self setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
}

- (void)setBackgroundImage:(NSString *)name {
    [self setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
}

@end