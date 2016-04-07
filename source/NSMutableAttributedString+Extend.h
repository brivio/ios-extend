@interface NSMutableAttributedString (Extend)
- (void)appendString:(NSString *)string;

- (void)appendString:(NSString *)string attributes:(NSDictionary *)attributes;

- (void)appendAttach:(NSTextAttachment *)attachment;

- (void)appendAttributedString:(NSAttributedString *)string attributes:(NSDictionary *)attributes;
@end