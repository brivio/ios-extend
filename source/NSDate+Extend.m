#import "NSDate+Extend.h"
#import "NSString+Extend.h"

@implementation NSDate (Extend)
+ (NSDate *)dateWidthTimestamp:(NSTimeInterval)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:timestamp];
}

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

- (NSString *)getFormattedString {

    NSDate *yesterdayStart = [self getDayStart:[[NSDate now] addDay:-1]];
    NSString *dayPartStr = [self getHour] < 12 ? @"上午" : @"下午";
    NSString *timeStr = [NSString stringWithFormat:@"%d:%02d", [self getHour] <= 12 ? [self getHour] : [self getHour] - 12, [self getMinute]];
    if ([self compare:yesterdayStart] == -1) {
        if ([self compare:[self getDayStart:[[NSDate now] addDay:-7]]] > 0) {
            return [NSString stringWithFormat:@"%@ %@ %@", [self getWeekString], dayPartStr, timeStr];
        } else if ([self compare:[self getDayStart:[[NSDate now] addYear:-1]]] > 0) {
            return [NSString stringWithFormat:@"%02d-%02d %@ %@", [self getMonth], [self getDay], dayPartStr, timeStr];
        } else {
            return [self toString];
        }
    } else if ([self compare:yesterdayStart] >= 0 && [self compare:[self getTodayStart]] <= 0) {
        return [NSString stringWithFormat:@"昨天 %@ %@", dayPartStr, timeStr];
    } else if ([self compare:[self getTodayStart]] > 0 && [self compare:[NSDate now]] < 0) {
        return [NSString stringWithFormat:@"%@ %@:%02d", dayPartStr, timeStr, [self getSecond]];
    } else {
        return [self toString];
    }
}

- (NSDate *)getTodayStart {
    return [self getDayStart:[NSDate now]];
}

- (NSDate *)getDayStart:(NSDate *)date {
    return [[NSString stringWithFormat:@"%d-%d-%d 00:00:00", [date getYear], [date getMonth], [date getDay]] toDate];
}

- (NSString *)getWeekString {
    switch ([self getWeek]) {
        case 1:
            return @"星期天";
        case 2:
            return @"星期一";
        case 3:
            return @"星期二";
        case 4:
            return @"星期三";
        case 5:
            return @"星期四";
        case 6:
            return @"星期五";
        case 7:
            return @"星期六";
        default:
            return @"";
    }
}

- (NSDate *)addYear:(NSInteger)year {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self];
    [components setYear:year];
    return [calendar dateByAddingComponents:components toDate:[NSDate now] options:0];
}

- (NSDate *)addMonth:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth fromDate:self];
    [components setMonth:month];
    return [calendar dateByAddingComponents:components toDate:[NSDate now] options:0];
}

- (NSDate *)addDay:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:self];
    [components setDay:day];
    return [calendar dateByAddingComponents:components toDate:[NSDate now] options:0];
}

- (NSDate *)addHour:(NSInteger)hour {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour fromDate:self];
    [components setHour:hour];
    return [calendar dateByAddingComponents:components toDate:[NSDate now] options:0];
}

- (NSDate *)addMinute:(NSInteger)minute {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMinute fromDate:self];
    [components setMinute:minute];
    return [calendar dateByAddingComponents:components toDate:[NSDate now] options:0];
}

- (NSDate *)addSecond:(NSInteger)second {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond fromDate:self];
    [components setSecond:second];
    return [calendar dateByAddingComponents:components toDate:[NSDate now] options:0];
}

- (NSInteger)getWeek {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)getYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)getMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)getDay {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)getHour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)getMinute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)getSecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

@end