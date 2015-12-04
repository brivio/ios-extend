@implementation UIColor (Extend)
+ (UIColor *)rgb:(int)rgbValue {
    return [UIColor rgb:rgbValue alpha:1];
}

+ (UIColor *)rgb:(int)rgbValue alpha:(CGFloat)alpha {
    return [UIColor
            colorWithRed:(CGFloat) ((((rgbValue & 0xFF0000) >> 16)) / 255.0)
                   green:(CGFloat) (((CGFloat) ((rgbValue & 0x00FF00) >> 8)) / 255.0)
                    blue:(CGFloat) (((CGFloat) (rgbValue & 0x0000FF)) / 255.0)
                   alpha:alpha];
}

@end