@implementation NSNotificationCenter (Extend)
+ (void)addObservers:(id)target selector:(SEL)aSelector names:(NSArray *)names {
    for (int i = 0; i < names.count; i++) {
        [[NSNotificationCenter defaultCenter] addObserver:target
                                                 selector:aSelector
                                                     name:names[i]
                                                   object:nil];
    }
}

+ (void)post:(NSString *)name {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
}

+ (void)post:(NSString *)name object:(id)object {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
}
@end