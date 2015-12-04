#import <Foundation/Foundation.h>

@interface UITableView (Extend)
- (instancetype)registerClass:(Class)cls;

- (instancetype)registerNib:(Class)cls;

@end