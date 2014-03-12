//
//  CalendarView.m
//  HHCalendar
//
//  Created by Stephen Hatton on 12/03/2014.
//  Copyright (c) 2014 Stephen Hatton. All rights reserved.
//

#import "CalendarView.h"
#import "CalendarDay.h"

//The "y-coordinate" where the calendar will start
#define calendarDatesYPosition  280
//How much the "y-coordinate" will change for each new weekly row of dates
#define calendarDatesYChange    50
//How much the "x-coordinate" will change for each new day of the month
#define calendarDatesXChange    50

@implementation CalendarView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _calendarDates = [[CalendarDates alloc] init];
        [_calendarDates currentMonth];
        [self drawUI];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
}

- (void)drawUI
{
    NSArray *daysBeforeMonth = [_calendarDates daysBefore];
    NSArray *daysOfMonth = [_calendarDates getAllDaysOfMonth];
    NSArray *daysAfterMonth = [_calendarDates daysAfter];
    
    int a = calendarDatesYPosition;

    for (int x = 0; x < [daysBeforeMonth count]; x++) {
        [self addSubview:[self constructLabel:
                          [NSString stringWithFormat:@"%@", [daysBeforeMonth objectAtIndex:x]] :(x+1)*calendarDatesXChange :a :200 :17 :1]];
    }
    
    for (CalendarDay *day in daysOfMonth) {
        if ([day getDayOfWeekNumber]==1)
            a-=calendarDatesYChange;
        [self addSubview:[self constructLabel:
                          [NSString stringWithFormat:@"%d", [day getDayNumber]] :
                          [day getDayOfWeekNumber]*calendarDatesXChange :a :200 :17 :0]];
    }
    
    for (int x = 0; x < [daysAfterMonth count]; x++) {
        [self addSubview:[self constructLabel:
                          [NSString stringWithFormat:@"%@", [daysAfterMonth objectAtIndex:x]] :(x+(8-(int)[daysAfterMonth count]))*calendarDatesXChange :a :200 :17 :1]];
    }
    
    //x+??? to get around this!
}

- (NSTextField *)constructLabel:(NSString *)string :(int)x :(int)y :(int)width :(int)height :(BOOL)colour
{
    NSTextField *textField = [[NSTextField alloc] init];
    textField = [[NSTextField alloc] init];
    [textField setBezeled:NO];
    [textField setDrawsBackground:NO];
    [textField setEditable:NO];
    [textField setSelectable:NO];
    [textField setStringValue:string];
    if (colour)
        [textField setTextColor:[NSColor grayColor]];
    [textField setFrame:NSMakeRect(x,y,width,height)];
    return textField;
}

@end
