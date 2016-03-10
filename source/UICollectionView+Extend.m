#import "UICollectionView+Extend.h"
#import "UIColor+Extend.h"


@implementation UICollectionView (Extend)
- (void)registerClass:(Class)cls {
    [self registerClass:cls forCellWithReuseIdentifier:[cls description]];
}

- (void)registerClasses:(NSArray *)array {
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self registerClass:obj];
    }];
}

- (void)registerNib:(Class)cls {
    [self registerNib:[UINib nibWithNibName:[cls description] bundle:nil] forCellWithReuseIdentifier:[cls description]];
}

- (void)registerNibs:(NSArray *)array {
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self registerNib:obj];
    }];
}

- (void)registerHeaderNib:(Class)cls {
    [self registerNib:[UINib nibWithNibName:[cls description] bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[cls description]];
}

- (void)registerHeaderNibs:(NSArray *)array {
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self registerHeaderNib:obj];
    }];
}

- (void)registerFooterNib:(Class)cls {
    [self registerNib:[UINib nibWithNibName:[cls description] bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[cls description]];
}

- (void)registerFooterNibs:(NSArray *)array {
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self registerFooterNib:obj];
    }];
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