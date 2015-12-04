@implementation NSString (Extend)
- (instancetype)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (instancetype)replace:(NSString *)search to:(NSString *)to {
    return [self stringByReplacingOccurrencesOfString:search withString:to];
}

- (instancetype)pad:(NSUInteger)pad {
    NSMutableString *format_prefix = [NSMutableString new];
    for (NSUInteger i = 0; i < pad; i++) {
        [format_prefix appendString:@" "];
    }
    return [[NSString alloc] initWithFormat:@"%@%@%@", format_prefix, self, format_prefix];
}

- (CGFloat)getWidth:(NSUInteger)fontSize {
    return [self sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}].width;
}

- (CGFloat)getHeight:(NSUInteger)fontSize width:(CGFloat)width {
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                              options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                           attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}
                              context:nil].size.height;
}

- (NSData *)toData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)stringWithDateFormat:(NSString *)format {
    NSDate *date = [self dateWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}

- (NSDate *)toDate {
    return [self dateWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSDate *)dateWithDateFormat:(NSString *)format {
    NSDate *date;
    @try {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = format;
        date = [dateFormatter dateFromString:self];
    } @catch (NSException *e) {

    }
    if (date == nil) {
        date = [NSDate new];
    }
    return date;
}

- (BOOL)isMobile {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString *CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";

    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];

    return [regextestmobile evaluateWithObject:self]
            || [regextestcm evaluateWithObject:self]
            || [regextestct evaluateWithObject:self]
            || [regextestcu evaluateWithObject:self];
}

- (BOOL)isUrl {
    NSURL *url = [NSURL URLWithString:self];
    NSArray *schemes = @[@"http", @"https", @"ftp"];
    for (int i = 0; i < schemes.count; ++i) {
        if ([url.scheme isEqualToString:schemes[i]]) {
            return YES;
        }
    }
    return NO;
}

- (NSString *)host {
    if (![self isUrl])return nil;
    return [NSURL URLWithString:self].host;
}

- (BOOL)isEmpty {
    if ([self length] == 0) {
        return YES;
    }
    return ![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length];

}

@end