#import <Foundation/Foundation.h>

@interface UILabel (Extend)
- (CGFloat)width;

- (void)textSize:(CGFloat)fontSize;

- (void)makeRoundWithTitle:(NSString *)title borderColor:(int)borderColor widthConstraint:(NSLayoutConstraint *)widthConstraint;

- (void)makeRoundWithTitle:(NSString *)title widthConstraint:(NSLayoutConstraint *)widthConstraint;

- (void)textColor:(int)rgbValue;
@end