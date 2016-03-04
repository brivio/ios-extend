#import "WKWebView+Extend.h"

@implementation WKWebView (Extend)
- (void)loadHTML:(NSString *)html {
    if (html == nil)return;
    NSString *style = [NSString stringWithFormat:@"\
<style type='text/css'>\
body{padding:0px;margin:0px;}\
img{max-width:%.0fpx;}\
            </style>\
    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no\"/>\
    <meta http-equiv=\"cache-control\" content=\"no-cache, must-revalidate\">", self.frame.size.width];
    html = [NSString stringWithFormat:@"%@%@", style, html];
//    NSLog(@"%@",html);
    [self loadHTMLString:html baseURL:nil];
}
/*
 <script>
setInterval(function(){
   var message={'method':'updateWebView'};
   window.webkit.messageHandlers._global.postMessage(message);
},200);
</script>\
 */
- (void)stop {
    if (self.loading) {
        [self stopLoading];
    }
    self.UIDelegate = nil;
}
@end