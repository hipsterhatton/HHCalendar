//
//  DateMethods.h
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateMethods : NSObject

+ (int)getDayOfWeek:(int)day :(int)month :(int)year;

+ (int)getNumberOfDaysInMonth:(int)month :(int)year;
+ (NSMutableArray *)getNumberOfDaysPreviousMonth:(int)firstWeekdayOfMonth :(int)currentMonth :(int)currentYear;
+ (NSMutableArray *)getNumberOfDaysNextMonth:(int)lastWeekdayOfMonth;

+ (NSString *)getDayName:(int)dayNumber;
+ (NSString *)getMonthName:(int)monthNumber;
+ (NSArray *)getMonthAndYear:(NSDate *)date;

@end
