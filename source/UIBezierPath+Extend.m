#import "UIBezierPath+Extend.h"

@implementation UIBezierPath (Extend)
- (UIBezierPath *)getHearts:(CGRect)originalRect scale:(CGFloat)scale {
    CGFloat scaleWidth = originalRect.size.width * scale;
    CGFloat scaleXValue = (originalRect.size.width - scaleWidth) / 2;
    CGFloat scaleHeight = originalRect.size.height * scale;
    CGFloat scaleYValue = (originalRect.size.height - scaleHeight) / 2;
    CGRect scaleRect = CGRectMake(scaleXValue, scaleYValue, scaleWidth, scaleHeight);

    [self moveToPoint:CGPointMake(originalRect.size.width / 2, scaleRect.origin.y + originalRect.size.height * 0.75f)];

    //左下
    [self addCurveToPoint:CGPointMake(scaleRect.origin.x, scaleRect.origin.y + scaleRect.size.height / 4)
            controlPoint1:CGPointMake(scaleRect.origin.x + scaleRect.size.width / 2, scaleRect.origin.y + scaleRect.size.height * 3 / 4)
            controlPoint2:CGPointMake(scaleRect.origin.x, scaleRect.origin.y + scaleRect.size.height / 2)];

    //左上1/4圆
    [self addArcWithCenter:CGPointMake(scaleRect.origin.x + scaleRect.size.width / 4, scaleRect.origin.y + scaleRect.size.height / 4)
                    radius:scaleRect.size.width / 4
                startAngle:(CGFloat) M_PI
                  endAngle:0
                 clockwise:YES];
    //右上1/4圆
    [self addArcWithCenter:CGPointMake(scaleRect.origin.x + scaleRect.size.width * 3 / 4, scaleRect.origin.y + scaleRect.size.height / 4)
                    radius:scaleRect.size.width / 4
                startAngle:(CGFloat) M_PI
                  endAngle:0
                 clockwise:YES];

    //右下
    [self addCurveToPoint:CGPointMake(originalRect.size.width / 2, scaleRect.origin.y + scaleRect.size.height)
            controlPoint1:CGPointMake(scaleRect.origin.x + scaleRect.size.width, scaleRect.origin.y + scaleRect.size.height / 2)
            controlPoint2:CGPointMake(scaleRect.origin.x + scaleRect.size.width * 1 / 2, scaleRect.origin.y + scaleRect.size.height * 3 / 4)];

    [self closePath];
    [self fill];
    return self;
}

@end