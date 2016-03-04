#import <Foundation/Foundation.h>

@interface UILabel (Extend)

- (void)textSize:(CGFloat)fontSize;

- (void)makeRoundWithTitle:(NSString *)title borderColor:(int)borderColor widthConstraint:(NSLayoutConstraint *)widthConstraint;

- (void)makeRoundWithTitle:(NSString *)title widthConstraint:(NSLayoutConstraint *)widthConstraint;

@end