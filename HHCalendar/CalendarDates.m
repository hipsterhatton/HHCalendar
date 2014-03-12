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
    //General method used to create all the "Calendar Days" for each month
    
    //Wipe all the current days
    [_days removeAllObjects];
    
    //Get the day of the week for the 1st of then month (used when calculating what day of the week the day is)
    int dayOfWeek = [DateMethods getDayOfWeek:1 :_monthNumber :_yearNumber];
    
    //Get the number of days in the month
    int numberOfDays = [DateMethods getNumberOfDaysInMonth:_monthNumber :_yearNumber];
    
    //Loop aroudn and create these "Calendar Days" and add them to the array
    for (int a = 1; a < numberOfDays+1; a++) {
        if (dayOfWeek==8)
            dayOfWeek=1;
        [_days addObject:[[CalendarDay alloc] initWithDay:a :dayOfWeek]];
        dayOfWeek++;
    }
    
    //Set the month name
    _monthName = [DateMethods getMonthName:_monthNumber];
    
    // * Optional * these gets the days just before and after this month (used to "fill" in the calendar in the UI)
    _daysBefore = [DateMethods getNumberOfDaysPreviousMonth:[[self getFirstDayOfMonth] getDayOfWeekNumber] :_monthNumber :_yearNumber];
    _daysAfter = [DateMethods getNumberOfDaysNextMonth:[[self getLastDayOfMonth] getDayOfWeekNumber]];
}

- (void)currentMonth
{
    //Get the details of the month using the system date (day, month, year)
    
    //This method gets the current day/month/year in an array format so that we can easily extract what we need
    NSArray *currentMonth = [DateMethods getMonthAndYear:[NSDate date]];
    
    _dayNumber = (int)[currentMonth[0] integerValue];
    _monthNumber = (int)[currentMonth[1]  integerValue];
    _yearNumber = (int)[currentMonth[2]  integerValue];
    
    //Call the "getMonth" method so that I can create the days for this month
    [self getMonth];
}

- (void)previousMonth
{
    //Get the details of the previous month
    
    //Loop around code: if at the 1st month of year, go to 12th month + previous year
    if (_monthNumber==1) {_monthNumber = 12; _yearNumber--;} else { _monthNumber--; }
    //Set the day of the month to 1
    _dayNumber = 1;
    [self getMonth];
}

- (void)nextMonth
{
    //Get the details of the next month
    
    //Loop around code: if at the 12th month of year, go to 12st month + next year
    if (_monthNumber==12) { _monthNumber = 1; _yearNumber++; } else { _monthNumber++; }
    //Set the day of the month to 1
    _dayNumber = 1;
    [self getMonth];
}




- (CalendarDay *)getFirstDayOfMonth
{
    return [_days objectAtIndex:0];
}

- (CalendarDay *)getLastDayOfMonth
{
    return [_days objectAtIndex:[_days count]-1];
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
