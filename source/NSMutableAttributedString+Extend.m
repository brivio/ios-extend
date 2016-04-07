#import "NSMutableAttributedString+Extend.h"

@implementation NSMutableAttributedString (Extend)
- (void)appendString:(NSString *)string {
    [self appendAttributedString:[[NSMutableAttributedString alloc] initWithString:string]];
}

- (void)appendString:(NSString *)string attributes:(NSDictionary *)attributes {
    NSUInteger start = self.length;
    [self appendString:string];
    [self addAttributes:attributes range:NSMakeRange(start, string.length)];
}

- (void)appendAttributedString:(NSAttributedString *)string attributes:(NSDictionary *)attributes {
    NSUInteger start = self.length;
    [self appendAttributedString:string];
    [self addAttributes:attributes range:NSMakeRange(start, string.length)];
}

- (void)appendAttach:(NSTextAttachment *)attachment {
    [self appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
}
@end