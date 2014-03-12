//
//  DateMethods.m
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import "DateMethods.h"

@implementation DateMethods

+ (int)getNumberOfDaysInMonth:(int)day :(int)month :(int)year
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [cal setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    comps = [cal components:NSWeekdayCalendarUnit fromDate:[cal dateFromComponents:comps]];
    
    [comps setDay:day];
    [comps setMonth:month];
    [comps setYear:year];
    
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[cal dateFromComponents:comps]];
    //    NSLog(@"Date Is: %@ Number Of Days In Month Are: %d", [cal dateFromComponents:comps], (int)range.length);
    return (int)range.length;
}

+ (int)getDayOfWeek:(int)day :(int)month :(int)year
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [cal setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    comps = [cal components:NSDayCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:[cal dateFromComponents:comps]];
    
    [comps setDay:day];
    [comps setMonth:month];
    [comps setYear:year];
    
    NSDateFormatter *weekdayFormatter = [[NSDateFormatter alloc] init];
    [weekdayFormatter setDateFormat: @"e"];
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
    
    //    NSLog(@"Month Starts On: %@", [self getDayName:[[weekdayFormatter stringFromDate: date] intValue]]);
    return [[weekdayFormatter stringFromDate: date] intValue];
}




+ (NSMutableArray *)getDaysFrontOfMonth:(int)firstWeekdayOfMonth :(int)currentMonth :(int)currentYear
{
    NSMutableArray *datesInFront = [[NSMutableArray alloc] init];
    
    if (firstWeekdayOfMonth < 7) {
        //Wrap around the dates
        currentMonth--;
        if (currentMonth==-1) {
            currentMonth=12;
            currentYear--;
        }
        int numberOfDaysInPreviousMonth = [self getNumberOfDaysInMonth:1 :currentMonth :currentYear];
        //Then need to do loop backwards, counting down from here until we reach 0/1 on the weekdays :D
        while (firstWeekdayOfMonth>1) {
            [datesInFront insertObject:[NSNumber numberWithInt:numberOfDaysInPreviousMonth--] atIndex:0];
            firstWeekdayOfMonth--;
        }
    }
    
    return datesInFront;
}

+ (NSMutableArray *)getDaysBackOfMonth:(int)lastWeekdayOfMonth
{
    NSMutableArray *datesInBack = [[NSMutableArray alloc] init];
    int temp = 1;
    
    if (lastWeekdayOfMonth < 7)
        while (temp < (8-lastWeekdayOfMonth))
            [datesInBack addObject:[NSNumber numberWithInt:temp++]];
    
    return datesInBack;
}




+ (NSString *)getDayName:(int)dayNumber
{
    switch (dayNumber) {
            
        case 7:
            return @"Sunday";
            break;
            
        case 1:
            return @"Monday";
            break;
            
        case 2:
            return @"Tuesday";
            break;
            
        case 3:
            return @"Wednesday";
            break;
            
        case 4:
            return @"Thursday";
            break;
            
        case 5:
            return @"Friday";
            break;
            
        case 6:
            return @"Saturday";
            break;
            
        default:
            return @"";
            break;
    }
}

+ (NSString *)getMonthName:(int)monthNumber
{
    switch (monthNumber) {
            
        case 1:
            return @"January";
            break;
            
        case 2:
            return @"February";
            break;
            
        case 3:
            return @"March";
            break;
            
        case 4:
            return @"April";
            break;
            
        case 5:
            return @"May";
            break;
            
        case 6:
            return @"June";
            break;
            
        case 7:
            return @"July";
            break;
            
        case 8:
            return @"August";
            break;
            
        case 9:
            return @"September";
            break;
            
        case 10:
            return @"October";
            break;
            
        case 11:
            return @"November";
            break;
            
        case 12:
            return @"December";
            break;
            
        default:
            return @"";
            break;
    }
}

+ (NSArray *)getMonthAndYearNumbers:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit fromDate:[NSDate date]];
    return @[
             [NSNumber numberWithInteger:[comps day]],
             [NSNumber numberWithInteger:[comps month]],
             [NSNumber numberWithInteger:[comps year]]
             ];
}

@end
