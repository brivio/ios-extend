#import "UITextField+Extend.h"
#import "common.h"

PROPERTY_STRING(UITextField, MAX_LENGTH);

@implementation UITextField (Extend)

- (void)setTextLength:(NSUInteger)length {
    [self setTextLength:length placeholder:[NSString stringWithFormat:@"可输入%lu个字符", (unsigned long) length]];
}

- (void)setTextLength:(NSUInteger)length placeholder:(NSString *)text {
    self.MAX_LENGTH = [NSString stringWithFormat:@"%lu", (unsigned long) length];
    self.placeholder = text;
    [self addTarget:self action:@selector(onCommentTFChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)onCommentTFChange {
    if (self.text.length > [self.MAX_LENGTH intValue]) {
        self.text = [self.text substringToIndex:(NSUInteger) [self.MAX_LENGTH intValue]];
    }
}

- (void)setPlaceholderColor:(UIColor *)color {
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}
@end