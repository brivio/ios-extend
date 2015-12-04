@implementation UITableView (Extend)

- (instancetype)registerClass:(Class)cls {
    [self registerClass:cls forCellReuseIdentifier:[cls description]];
    return self;
}

- (instancetype)registerNib:(Class)cls {
    [self registerNib:[UINib nibWithNibName:[cls description] bundle:nil] forCellReuseIdentifier:[cls description]];
    return self;
}
@end