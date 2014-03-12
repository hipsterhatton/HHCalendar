//
//  DateMethods.h
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateMethods : NSObject

+ (int)getNumberOfDaysInMonth:(int)day :(int)month :(int)year;
+ (int)getDayOfWeek:(int)day :(int)month :(int)year;

+ (NSMutableArray *)getDaysFrontOfMonth:(int)firstWeekdayOfMonth :(int)currentMonth :(int)currentYear;
+ (NSMutableArray *)getDaysBackOfMonth:(int)lastWeekdayOfMonth;

+ (NSString *)getDayName:(int)dayNumber;
+ (NSString *)getMonthName:(int)monthNumber;
+ (NSMutableArray *)getMonthAndYearNumbers:(NSDate *)date;

@end
