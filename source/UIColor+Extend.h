#import <Foundation/Foundation.h>

@interface UIColor (Extend)
+ (UIColor *)rgb:(int)rgbValue;

+ (UIColor *)rgb:(int)rgbValue alpha:(CGFloat)alpha;
@end