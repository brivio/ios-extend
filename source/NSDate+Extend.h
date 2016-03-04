#import <Foundation/Foundation.h>

@interface NSDate (Extend)
- (NSString *)toString;

+ (NSDate *)now;

- (NSTimeInterval)timeIntervalOffset:(NSDate *)anotherDate;

- (NSString *)timeIntervalOffsetHMS:(NSDate *)anotherDate;
@end