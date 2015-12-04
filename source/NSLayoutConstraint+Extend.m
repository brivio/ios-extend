#import "NSLayoutConstraint+Extend.h"

@implementation NSLayoutConstraint (Extend)
- (NSString *)description {
    return [NSString stringWithFormat:@"id: %@, constant: %f", self.identifier, self.constant];
}
@end