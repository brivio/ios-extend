#import <Foundation/Foundation.h>

@interface UIApplication (Extend)
+ (void)openSettings;

+ (void)openUrl:(NSString *)url;

+ (void)openUrlForTel:(NSString *)tel;

+ (NSString *)UUID;
@end