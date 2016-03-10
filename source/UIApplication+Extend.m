#import "UIApplication+Extend.h"
#import "SSKeychain.h"
#import "NSBundle+Extend.h"
#import "NSString+Extend.h"

@implementation UIApplication (Extend)
+ (void)openSettings {
    BOOL canOpenSettings = (&UIApplicationOpenSettingsURLString != NULL);
    if (canOpenSettings) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }
}

+ (void)openUrl:(NSString *)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

+ (void)openUrlForTel:(NSString *)tel {
    [UIApplication openUrl:[NSString stringWithFormat:@"tel://%@", tel]];
}

+ (NSString *)UUID {
    NSString *currentDeviceUUIDStr = [SSKeychain passwordForService:@" " account:[NSBundle getAppName]];
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""]) {
        NSUUID *currentDeviceUUID = [UIDevice currentDevice].identifierForVendor;
        currentDeviceUUIDStr = currentDeviceUUID.UUIDString;
        currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
        [SSKeychain setPassword:currentDeviceUUIDStr forService:@" " account:[NSBundle getAppName]];
    }
    return [currentDeviceUUIDStr md5];
}
@end