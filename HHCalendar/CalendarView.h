//
//  CalendarView.h
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CalendarDates.h"

@interface CalendarView : NSView

@property(nonatomic, retain) CalendarDates *calendarDates;

@end
