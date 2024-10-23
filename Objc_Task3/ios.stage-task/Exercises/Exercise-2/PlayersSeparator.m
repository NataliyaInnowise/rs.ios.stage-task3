#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    if (!ratingArray || ratingArray.count < 3) {
            return 0;
        }
    
    NSInteger count = 0;
    NSUInteger n = ratingArray.count;
    
    for (NSUInteger i = 0; i < n - 2; i++) {
        for (NSUInteger j = i + 1; j < n - 1; j++) {
            for (NSUInteger k = j + 1; k < n; k++) {

                if (ratingArray[i].integerValue < ratingArray[j].integerValue &&
                    ratingArray[j].integerValue < ratingArray[k].integerValue) {
                    count++;
                }
                // Check for decreasing condition
                else if (ratingArray[i].integerValue > ratingArray[j].integerValue &&
                         ratingArray[j].integerValue > ratingArray[k].integerValue) {
                    count++;
                }
            }
        }
    }
    return count;
}

@end
