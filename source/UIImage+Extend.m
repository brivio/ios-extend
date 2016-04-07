#import "UIImage+Extend.h"
#import "Extend.h"

@implementation UIImage (Extend)
+ (UIImage *)load:(NSString *)url {
    if (url == nil)return nil;
    UIImageView *imageView = [UIImageView new];
    [imageView load:url];
    return imageView.image;
}

- (UIImage *)transformWidth:(size_t)width
                     height:(size_t)height {
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [self drawInRect:CGRectMake(0, 0, width, height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end