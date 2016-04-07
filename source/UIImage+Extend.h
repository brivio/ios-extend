#import <Foundation/Foundation.h>

@interface UIImage (Extend)
+ (UIImage *)load:(NSString *)url;

- (UIImage *)transformWidth:(size_t)width
                     height:(size_t)height;
@end