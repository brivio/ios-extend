@interface UICollectionView (Extend)
- (void)registerClass:(Class)cls;

- (void)registerClasses:(NSArray *)array;

- (void)registerNib:(Class)cls;

- (void)registerHeaderNib:(Class)cls;

- (void)registerHeaderNibs:(NSArray *)array;

- (void)registerFooterNib:(Class)cls;

- (void)registerFooterNibs:(NSArray *)array;

- (void)registerNibs:(NSArray *)array;

- (void)highlight:(NSIndexPath *)indexPath color:(UIColor *)color;

- (void)unHighlight:(NSIndexPath *)indexPath color:(UIColor *)color;
@end