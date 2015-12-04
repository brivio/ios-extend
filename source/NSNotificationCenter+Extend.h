#import <Foundation/Foundation.h>

@interface NSNotificationCenter (Extend)
+ (void)addObservers:(id)target selector:(SEL)aSelector names:(NSArray *)names;

+ (void)post:(NSString *)name;

+ (void)post:(NSString *)name object:(id)object;
@end