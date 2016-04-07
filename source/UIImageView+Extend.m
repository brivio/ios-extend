#import "UIImageView+WebCache.h"

@implementation UIImageView (Extend)
- (void)load:(NSString *)url {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"img_placeholder"] options:SDWebImageRefreshCached];
}
@end