#import <Foundation/Foundation.h>

@interface UITextField (Extend)

- (void)setTextLength:(NSUInteger)length;

- (void)setTextLength:(NSUInteger)length placeholder:(NSString *)text;
@end