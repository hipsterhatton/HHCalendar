//
//  CalendarDay.m
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import "CalendarDay.h"
#include "DateMethods.h"

@implementation CalendarDay

- (id)initWithDay:(int)day :(int)dayOfWeek
{
    _day = day;
    _dayOfWeek = dayOfWeek;
    return self;
}

- (int)getDayNumber
{
    return _day;
}

- (int)getDayOfWeekNumber
{
    return _dayOfWeek;
}

- (NSString *)getDayOfWeekString
{
    return [DateMethods getDayName:_dayOfWeek];
}

@end
