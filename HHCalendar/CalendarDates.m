//
//  CalendarDates.m
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import "CalendarDates.h"
#import "DateMethods.h"

@implementation CalendarDates

- (id)init
{
    _days = [[NSMutableArray alloc] init];
    _daysBefore = [[NSMutableArray alloc] init];
    _daysAfter = [[NSMutableArray alloc] init];
    return self;
}

- (void)getMonth
{
    //General method to get create all the "days" d/s's for the month and get the name of the month
    
    [_days removeAllObjects];
    int dayOfWeek = [DateMethods getDayOfWeek:1 :_monthNumber :_yearNumber];
    int numberOfDays = [DateMethods getNumberOfDaysInMonth:_dayNumber :_monthNumber :_yearNumber];
    for (int a = 1; a < numberOfDays+1; a++) {
        if (dayOfWeek==8)
            dayOfWeek=1;
        [_days addObject:[[CalendarDay alloc] initWithDay:a :dayOfWeek]];
        dayOfWeek++;
    }
    _monthName = [DateMethods getMonthName:_monthNumber];
    
    _daysBefore = [DateMethods getDaysFrontOfMonth:6 :03 :2014];
    _daysAfter = [DateMethods getDaysBackOfMonth:1];
}

- (void)currentMonth
{
    //Get the details of the month using the system date (day, month, year)
    NSArray *currentMonth = [DateMethods getMonthAndYearNumbers:[NSDate date]];
    
    _dayNumber = (int)[currentMonth[0] integerValue];
    _monthNumber = (int)[currentMonth[1]  integerValue];
    _yearNumber = (int)[currentMonth[2]  integerValue];
    [self getMonth];
}

- (void)previousMonth
{
    //Loop around code: if at the 1st month of year, go to 12th month + previous year
    if (_monthNumber==1) {_monthNumber = 12; _yearNumber--;} else { _monthNumber--; }
    //Set the day of the month to 1
    _dayNumber = 1;
    [self getMonth];
}

- (void)nextMonth
{
    //Loop around code: if at the 12th month of year, go to 12st month + next year
    if (_monthNumber==12) { _monthNumber = 1; _yearNumber++; } else { _monthNumber++; }
    //Set the day of the month to 1
    _dayNumber = 1;
    [self getMonth];
}

- (CalendarDay *)getDayOfMonth:(int)x
{
    return [_days objectAtIndex:x];
}

- (NSArray *)getAllDaysOfMonth
{
    return _days;
}

- (NSString *)getNameOfMonth
{
    return _monthName;
}

@end
