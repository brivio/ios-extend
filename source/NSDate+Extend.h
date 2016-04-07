#import <Foundation/Foundation.h>

@interface NSDate (Extend)
+ (NSDate *)dateWidthTimestamp:(NSTimeInterval)timestamp;

- (NSString *)toString;

+ (NSDate *)now;

- (NSTimeInterval)timeIntervalOffset:(NSDate *)anotherDate;

- (NSString *)timeIntervalOffsetHMS:(NSDate *)anotherDate;

- (NSDate *)addYear:(NSInteger)year;

- (NSDate *)addMonth:(NSInteger)month;

- (NSDate *)addDay:(NSInteger)day;

- (NSDate *)addHour:(NSInteger)hour;

- (NSDate *)addMinute:(NSInteger)minute;

- (NSDate *)addSecond:(NSInteger)second;

- (NSInteger)getWeek;

- (NSInteger)getYear;

- (NSInteger)getMonth;

- (NSInteger)getDay;

- (NSInteger)getHour;

- (NSInteger)getMinute;

- (NSInteger)getSecond;

- (NSString *)getFormattedString;

- (NSDate *)getTodayStart;

- (NSDate *)getDayStart:(NSDate *)date;

- (NSString *)getWeekString;
@end