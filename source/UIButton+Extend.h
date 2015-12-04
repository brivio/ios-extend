#import <Foundation/Foundation.h>

@interface UIButton (Extend)
- (void)setTitle:(NSString *)title;

- (void)setAttributedTitle:(NSAttributedString *)title;

- (void)setTitleColor:(UIColor *)color;

- (void)setImage:(NSString *)name;

- (void)setBackgroundImage:(NSString *)name;
@end