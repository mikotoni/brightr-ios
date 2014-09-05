//
//  Coach.h
//  Cortex
//
//  Created by Pim Nijdam on 14/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import "../AIModule.h"
@class Message;
@class Task;

///All known coach types. This enum might be expanded in future releases.
typedef enum {kCOACH_TYPE_PHYSICAL_ACTIVITY,
    kCOACH_TYPE_MENTAL_RESILIENCE,
    kCOACH_TYPE_SLEEP_DURATION,
    kCOACH_TYPE_JETLAG,
    kCOACH_TYPE_SHIFTWORK,
    kCOACH_TYPE_CALIBRATION,
    kCOACH_TYPE_NONE} CoachType;


/** Notification notifying the coach send a new message. The application should subscribe on the notifications and handle them.
 */
extern NSString* kCORTEX_COACHING_ENGINE_NEW_MESSAGE_NOTIFICATION;

/** Base class for all coaches.
 * Coaches do nothing until a goal has been set. Then they will start producing messages and tasks. It's up to the
 * application to communicate the tasks and messages to the user.
 * When using CSCoachingEngine to get the coaches they will automatically be started upon a restart.
 */
@interface Coach : AIModule
- (id) init;

/** Return all tasks the coach has set for the user.
 * @return An NSArray* of Task* objects.
 */
- (NSArray*) getCurrentTasks;
/** Return tasks planned for the future specified time period.
 * @return An NSArray* of Task* objects.
 */
- (NSArray*) getFutureTasksFrom:(NSDate*) from to:(NSDate*) to;

/** Return all tasks the coach has set in the past for the specified time period.
 * @return An NSArray* of Task* objects.
 */
- (NSArray*) getPastTasksFrom:(NSDate*) from to:(NSDate*) to;

/** Pause the coach.
 * This function can be used to pause the coach temporarily, e.g. when the user is on a holiday.
 */
- (void) pause;
/** Resume coach
 * Resumes the coach if it was paused
 */
- (void) resume;

/** Set the value for a task manually.
 * @param dateValue NSDictionary with @"date" and @"value" keys containing the new value
 * @param the task for which the value should be updated
 * @return the updated task
 */
- (Task*) setValue:(NSDictionary*) dateValue forTask:(Task*) task;

+ (NSString*) stringFromCoachType:(CoachType) type;
+ (CoachType) coachTypeFromString:(NSString*) string;

///Type to identifies the coach
@property (readonly, nonatomic) CoachType type;
@end
