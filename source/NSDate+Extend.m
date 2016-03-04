#import "NSDate+Extend.h"

@implementation NSDate (Extend)
- (NSString *)toString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter stringFromDate:self];
}

+ (NSDate *)now {
    return [NSDate date];
}

- (NSTimeInterval)timeIntervalOffset:(NSDate *)anotherDate {
    NSTimeInterval nowInterval = [self timeIntervalSince1970];
    NSTimeInterval anotherInterval = [anotherDate timeIntervalSince1970];
    return abs((int) (nowInterval - anotherInterval));
}

- (NSString *)timeIntervalOffsetHMS:(NSDate *)anotherDate {
    int offset = (int) [self timeIntervalOffset:anotherDate];
    int hours = offset / 3600;
    int minutes = (offset - hours * 3600) / 60;
    int seconds = offset - hours * 3600 - minutes * 60;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}
@end