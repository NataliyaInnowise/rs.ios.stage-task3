#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    self.resultString = [NSMutableString string];
    
    NSMutableString *str1 = [NSMutableString stringWithString:string1];
    NSMutableString *str2 = [NSMutableString stringWithString:string2];
    
    while (str1.length > 0 || str2.length > 0) {
        if (str1.length == 0) {
            [self.resultString appendString:str2];
            break;
        }
        if (str2.length == 0) {
            [self.resultString appendString:str1];
            break;
        }
        
        unichar firstCharStr1 = [str1 characterAtIndex:0];
        unichar firstCharStr2 = [str2 characterAtIndex:0];
        
        if (firstCharStr1 == firstCharStr2) {
            if ([str1 compare:str2] == NSOrderedAscending) {
                [self.resultString appendFormat:@"%C", firstCharStr1];
                [str1 deleteCharactersInRange:NSMakeRange(0, 1)];
            } else {
                [self.resultString appendFormat:@"%C", firstCharStr2];
                [str2 deleteCharactersInRange:NSMakeRange(0, 1)];
            }
        } else if (firstCharStr1 < firstCharStr2) {
            [self.resultString appendFormat:@"%C", firstCharStr1];
            [str1 deleteCharactersInRange:NSMakeRange(0, 1)];
        } else {
            [self.resultString appendFormat:@"%C", firstCharStr2];
            [str2 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    
    return [self.resultString copy];
}

@end
