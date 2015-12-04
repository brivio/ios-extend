#import <Foundation/Foundation.h>

@interface UICollectionView (Extend)
- (void)registerClass:(Class)cls;

- (void)registerNib:(Class)cls;

- (void)registerNibs:(NSArray *)array;

- (void)highlight:(NSIndexPath *)indexPath color:(UIColor *)color;

- (void)unHighlight:(NSIndexPath *)indexPath color:(UIColor *)color;
@end