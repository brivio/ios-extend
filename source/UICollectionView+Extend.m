#import "UICollectionView+Extend.h"
#import "UIColor+Extend.h"


@implementation UICollectionView (Extend)
- (void)registerClass:(Class)cls {
    [self registerClass:cls forCellWithReuseIdentifier:[cls description]];
}

- (void)registerNib:(Class)cls {
    [self registerNib:[UINib nibWithNibName:[cls description] bundle:nil] forCellWithReuseIdentifier:[cls description]];
}

- (void)registerHeaderNib:(Class)cls {
    [self registerNib:[UINib nibWithNibName:[cls description] bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[cls description]];
}

- (void)registerFooterNib:(Class)cls {
    [self registerNib:[UINib nibWithNibName:[cls description] bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[cls description]];
}

- (void)registerNibs:(NSArray *)array {
    for (NSUInteger i = 0; i < array.count; i++) {
        [self registerNib:array[i]];
    }
}

- (void)highlight:(NSIndexPath *)indexPath color:(UIColor *)color {
    [UIView animateWithDuration:0.1
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [[self cellForItemAtIndexPath:indexPath] setBackgroundColor:color];
                     }
                     completion:nil];
}

- (void)unHighlight:(NSIndexPath *)indexPath color:(UIColor *)color {
    [UIView animateWithDuration:0.1
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [[self cellForItemAtIndexPath:indexPath] setBackgroundColor:color];
                     }
                     completion:nil];
}

@end