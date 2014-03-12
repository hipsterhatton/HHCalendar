//
//  CalendarDates.h
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarDay.h"

@interface CalendarDates : NSObject

@property(nonatomic, retain) NSMutableArray *days;
@property(nonatomic, retain) NSMutableArray *daysBefore;
@property(nonatomic, retain) NSMutableArray *daysAfter;

@property(nonatomic, retain) NSString *monthName;
@property(nonatomic) int dayNumber;
@property(nonatomic) int monthNumber;
@property(nonatomic) int yearNumber;

- (void)currentMonth;
- (void)previousMonth;
- (void)nextMonth;

- (CalendarDay *)getDayOfMonth:(int)x;
- (NSArray *)getAllDaysOfMonth;
- (NSString *)getNameOfMonth;

@end
