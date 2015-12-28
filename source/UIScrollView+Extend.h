#import <Foundation/Foundation.h>

@interface UIScrollView (Extend)
- (void)setContentHeight:(CGFloat)height;

- (void)setContentWidth:(CGFloat)width;

- (void)goTop;

- (void)fitContent;
@end