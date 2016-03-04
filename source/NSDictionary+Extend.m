#import "NSDictionary+Extend.h"

@implementation NSDictionary (Extend)
- (NSString *)toJSON {
    if (self == nil) {
        return @"{}";
    }
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions) (0)
                                                         error:&error];

    if (!jsonData) {
        NSLog(@"toJSON: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

@end