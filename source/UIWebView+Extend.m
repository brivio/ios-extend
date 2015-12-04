#import <objc/runtime.h>
#import "UIView+Extend.h"
#import "UIWebView+Extend.h"

static const void *lastOffsetKey = "lastOffsetKey";
//static const void *bridgetKey = "bridge";

@implementation UIWebView (Extend)
@dynamic lastOffset;

- (void)setNOScroll {
    self.scrollView.scrollEnabled = NO;
    self.scrollView.bounces = NO;
}

- (void)loadHTML:(NSString *)html {
    if (html == nil)return;
    NSString *style = [NSString stringWithFormat:@"<style type='text/css'>\
body{padding:0px;margin:0px;}\
img{max-width:%.0fpx;}\
            </style>", self.frame.size.width];
    html = [NSString stringWithFormat:@"%@%@", style, html];
    [self loadHTMLString:html baseURL:nil];
}

- (void)reformatWithName:(NSString *)notification id:(NSString *)id {
    NSString *offset = [NSString stringWithFormat:@"%f", [self.scrollView contentSize].height - [self getHeight]];
    if ([offset intValue] < 1)return;
    [self setLastOffset:[NSString stringWithFormat:@"%d", [[self lastOffset] intValue] + [offset intValue]]];
    if ([[self lastOffset] intValue] > 1) {
        [[NSNotificationCenter defaultCenter]
                postNotificationName:notification
                              object:@{@"id" : id, @"offset" : [self lastOffset]}];
    }
}

- (void)injectJavascript:(NSString *)resource {
    NSString *jsPath = [[NSBundle mainBundle] pathForResource:resource ofType:@"js"];
    NSString *js = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:NULL];
    [self stringByEvaluatingJavaScriptFromString:js];
}

- (NSString *)lastOffset {
    return (NSString *) objc_getAssociatedObject(self, lastOffsetKey);
}

- (void)setLastOffset:(NSString *)lastOffset {
    objc_setAssociatedObject(self, lastOffsetKey, lastOffset, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end