//
//  Task.h
//  Cortex
//
//  Created by Pim Nijdam on 14/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coach.h"

@interface Task : NSObject <NSCopying>

typedef enum {
    kTASK_TYPE_NONE = 0,
    kTASK_TYPE_BE_ACTIVE,
    kTASK_TYPE_SLEEP,
    kTASK_TYPE_BE_RESILIENT,
    kTASK_TYPE_CALIBRATING,
    kTASK_TYPE_SLEEP_PERIOD_STAY_AWAKE,
    kTASK_TYPE_SLEEP_PERIOD_GO_TO_SLEEP,
    kTASK_TYPE_TAKE_MELATONIN,
    kTASK_TYPE_SLEEPY,
    kTASK_TYPE_UNWINDING,
    kTASK_TYPE_WAKING_UP,
    kTASK_TYPE_ACTIVE,
    kTASK_TYPE_BRIGHT_LIGHT,
    kTASK_TYPE_DIMMED_LIGHT,
    kTASK_TYPE_EXERCISE,
    kTASK_TYPE_TAKE_CAFFEINE,
    kTASK_TYPE_HAVE_BREAKFAST,
    kTASK_TYPE_HAVE_LUNCH,
    kTASK_TYPE_HAVE_DINNER,
    kTASK_TYPE_HAVE_SNACK,
    // Start of messages
    kTASK_TYPE_DRINK_ENGOUGH_WATER_ON_THE_PLANE,
    kTASK_TYPE_EAT_EXTRA_TODAY,
    //kTASK_TYPE_LIGHT_MEALS_DURING_FLIGHT,
    kTASK_TYPE_FIRST_NIGHT_MELATONIN,
    //kTASK_TYPE_WELKOM,
    //kTASK_TYPE_WALK_ON_THE_PLANE,
    kTASK_TYPE_FULLY_ADJUSTED,
} TaskType;

typedef enum {
    kTASK_STATUS_UNKNOWN = 0,
    kTASK_STATUS_SUCCEEDED,
    kTASK_STATUS_FAILED
} TaskStatus;

- (id) initWithCoachType:(CoachType) coachType startDate:(NSDate*)startDate endDate:(NSDate*) endDate taskDescription:(NSString*) taskDescription type:(TaskType) taskType target:(id) target value:(NSDictionary*) value status:(TaskStatus) status;
- (id) initWithJSON:(NSDictionary*) json;
- (NSDictionary*) toServerDictionary;
- (BOOL) isEqualToTask:(Task*) other;
- (Task*) setValue:(NSDictionary*) dateValue;

+ (NSString*) stringFromTaskType:(TaskType) type;
+ (TaskType) taskTypeFromString:(NSString*) string;

@property (readonly) TaskType type;
@property (readonly) id target;
@property (readonly) NSDictionary* value;
@property (readonly) NSDate* startDate;
@property (readonly) NSDate* endDate;
@property (readonly) NSString* taskDescription;
@property (readonly) TaskStatus status;
@property (readonly) CoachType coachType;
@property (readonly) NSArray* messages;
@end
