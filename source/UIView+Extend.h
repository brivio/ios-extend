#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIView (Extend)

- (void)resizeToFitSubviews;

- (CGFloat)getSubviewsHeight;

- (void)showLoading;

- (void)hideLoading;

- (CGFloat)getWidth;

- (CGFloat)getHeight;

- (CGFloat)getX;

- (CGFloat)getY;

- (void)setBorderWidth:(CGFloat)width;

- (void)setBorderColor:(UIColor *)color;

- (void)setBorderRadius:(CGFloat)radius;

- (void)setBorder:(CGFloat)radius color:(UIColor *)color;

- (void)makeRound;

- (void)click:(id)target action:(SEL)action;

- (BOOL)isTap:(UITapGestureRecognizer *)gestureRecognizer;

- (void)empty;

- (void)setCorner:(UIRectCorner)corners size:(CGFloat)size;

- (void)showQuickHUD:(NSString *)title;

- (void)showQuickHUD:(NSString *)title callback:(MBProgressHUDCompletionBlock)callback;

- (void)showProgressHUD:(NSString *)title;

- (void)showProgressHUD:(NSString *)title callback:(MBProgressHUDCompletionBlock)callback;

- (void)hideProgressHUD;

- (UIViewController *)viewController;

- (CGFloat)frameX;

- (CGFloat)frameY;

- (CGFloat)frameWidth;

- (CGFloat)frameHeight;

- (void)setFrameY:(CGFloat)y;

- (void)setFrameX:(CGFloat)x;

- (void)setFrameWidth:(CGFloat)width;

- (void)setFrameHeight:(CGFloat)height;

- (void)disableEdit;

@end