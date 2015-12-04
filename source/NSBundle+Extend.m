#import "NSBundle+Extend.h"


@implementation NSBundle (Extend)
+ (NSString *)getAppName {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
}

+ (NSString *)getAppVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}

+ (NSString *)getBuildVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"];
}

@end