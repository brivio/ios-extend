#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface WKWebView (Extend)
- (void)loadHTML:(NSString *)html;

- (void)stop;
@end