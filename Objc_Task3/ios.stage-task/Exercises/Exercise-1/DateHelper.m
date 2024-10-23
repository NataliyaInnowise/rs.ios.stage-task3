#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSArray *months = @[@"January", @"February", @"March", @"April", @"May", @"June",
                           @"July", @"August", @"September", @"October", @"November", @"December"];
       
       if (monthNumber < 1 || monthNumber > 12) {
           return nil;
       }

       return months[monthNumber - 1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
        NSDate *parsedDate = [formatter dateFromString:date];

        if (!parsedDate) {
            return 0;
        }
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:parsedDate];
        
        return [components day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {

    NSDateFormatter *formatter = [NSDateFormatter new];
    
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"ru_RU"]];
    
    [formatter setDateFormat:@"EE"];
    
    NSString *dayName = [formatter stringFromDate:date];
    
    return dayName;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *today = [NSDate date];
    
    NSDateComponents *inputWeekComponent = [calendar components:NSCalendarUnitWeekOfYear fromDate:date];
    NSDateComponents *currentWeekComponent = [calendar components:NSCalendarUnitWeekOfYear fromDate:today];
    
    NSDateComponents *inputYearComponent = [calendar components:NSCalendarUnitYear fromDate:date];
    NSDateComponents *currentYearComponent = [calendar components:NSCalendarUnitYear fromDate:today];
    
    BOOL isInSameWeek = (inputWeekComponent.weekOfYear == currentWeekComponent.weekOfYear) &&
                            (inputYearComponent.year == currentYearComponent.year);
    
    return isInSameWeek;
}

@end
