//
//  NSString+TimeOfSlider.m
//  PartyMaker
//
//  Created by Admin on 09.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "NSString+TimeOfSlider.h"

@implementation NSString (TimeOfSlider)
+ (NSString*)convertAll:(NSString *)valueInMinutes{
    int minutesStart = [valueInMinutes intValue];
    int hour = 0;
    int minutes = 0;
    hour = minutesStart / 60;
    minutes = minutesStart % 60;
    NSString *result = @"";
    
    NSString *hourS = @"";
    NSString *minutesS = @"";
    minutesS = [@(minutes) stringValue];
    hourS = [@(hour) stringValue];
    
    if (hour < 10) {
        if (minutes < 10) {
            
            
            
            hourS = [@"0" stringByAppendingString:hourS];
            minutesS = [@"0" stringByAppendingString:minutesS];
        }
        else if (minutes == 0){
            
            
            
            hourS = [@"0" stringByAppendingString:hourS];
            minutesS = [@"00" stringByAppendingString:minutesS];
        }
        else {
           
            
             hourS = [@"0" stringByAppendingString:hourS];
             minutesS = [@"" stringByAppendingString:minutesS];
        }
    }
    else if (hour == 0){
        if (minutes < 10) {
            
            hourS = [@"00" stringByAppendingString:hourS];
            minutesS = [@"0" stringByAppendingString:minutesS];
        }
        else if (minutes == 0){
          
            
            hourS = [@"00" stringByAppendingString:hourS];
            minutesS = [@"00" stringByAppendingString:minutesS];
        }
        else {
          
            result = [NSString stringWithFormat:@"00:%@", minutesS];
                    }
        
    }
    else {
        if (minutes < 10) {
            
            
            hourS = [@"" stringByAppendingString:hourS];
            minutesS = [@"0" stringByAppendingString:minutesS];
        }
        else if (minutes == 0){
           
            
            hourS = [@"" stringByAppendingString:hourS];
            minutesS = [@"00" stringByAppendingString:minutesS];
        }
        else {
            
            result = [NSString stringWithFormat:@"%@:%@", hourS, minutesS];
            
            
        }
        
    }
 return result;
}

@end
