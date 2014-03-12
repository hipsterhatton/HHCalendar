//
//  CalendarDay.h
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarDay : NSObject

@property(nonatomic) int day;
@property(nonatomic) int dayOfWeek;

- (id)initWithDay:(int)day :(int)dayOfWeek;
- (int)getDayNumber;
- (int)getDayOfWeekNumber;

@end
