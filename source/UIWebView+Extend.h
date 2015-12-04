#import <Foundation/Foundation.h>

@interface UIWebView (Extend)
@property(strong, nonatomic) NSString *lastOffset;

- (void)reformatWithName:(NSString *)notification id:(NSString *)id;

- (void)setNOScroll;

- (void)loadHTML:(NSString *)html;

- (void)injectJavascript:(NSString *)resource;
@end