#import "UIView+Extend.h"
#import "UIColor+Extend.h"

@implementation UILabel (Extend)
- (void)textSize:(CGFloat)fontSize {
    self.font = [UIFont systemFontOfSize:fontSize];
}

- (void)textColor:(int)rgbValue {
    self.textColor = [UIColor rgb:rgbValue];
}

- (void)makeRoundWithTitle:(NSString *)title borderColor:(int)borderColor widthConstraint:(NSLayoutConstraint *)widthConstraint {
    [self setBorderWidth:1];
    if (borderColor > 0) {
        [self setBorderColor:[UIColor rgb:borderColor]];
    }
    [self setBorderRadius:[self getHeight] / 2];
    self.text = title;
    self.textAlignment = NSTextAlignmentCenter;
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                          options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                       attributes:@{NSFontAttributeName : self.font}
                                          context:nil].size;
    widthConstraint.constant = size.width + [self getHeight];
}

- (void)makeRoundWithTitle:(NSString *)title widthConstraint:(NSLayoutConstraint *)widthConstraint {
    [self makeRoundWithTitle:title borderColor:0xffffff widthConstraint:widthConstraint];
}

- (CGFloat)width {
    return [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, self.font.pointSize)].width;
}
@end