#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIView (Extend)

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

- (void)empty;

- (void)setCorner:(UIRectCorner)corners size:(CGFloat)size;

- (void)showHUD:(NSString *)title;

- (void)showHUD:(NSString *)title callback:(MBProgressHUDCompletionBlock)callback;

- (UIViewController *)viewController;
@end