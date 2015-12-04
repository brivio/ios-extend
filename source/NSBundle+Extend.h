#import <Foundation/Foundation.h>

@interface NSBundle (Extend)
+ (NSString *)getAppName;

+ (NSString *)getAppVersion;

+ (NSString *)getBuildVersion;
@end