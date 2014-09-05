//
//  Historian.h
//  Cortex
//
//  Created by Pim Nijdam on 30/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import "Message.h"

@interface Historian : NSObject
/** Update a task. Should only be used by Coaches
 */
- (void) insertOrUpdateTask:(Task*) task;

/** Insert a message. Should only be used by Coaches.
 */
- (void) insertMessage:(Message*) message;

/** Get past tasks for a coach type.
 * This function is equivalent to [coach getPastTasksFrom: to:].
  * @return An NSArray* of Task* objects.
 */
- (NSArray*) getPastTasksForCoachType:(CoachType) coachType from:(NSDate*) from to:(NSDate*) to;

/** Get past tasks for the specified time range.
 * @param from from date, inclusive
 * @param to to date, exclusive
 * @return An NSArray* of Task* objects.
 */
- (NSArray*) getPastTasksFrom:(NSDate*)from to:(NSDate*) to;

/** Get all messages for a task.
 * This function is equivalent to task.messages
 */
- (NSArray*) getMessagesForTask:(Task*)task;

/** Get messages for the specified time range.
 * This function returns all messages triggered during the specified time range. Note that this
 * includes messages for both current and past tasks.
 * @param from from date (inclusive) for the Message.triggerTime
 * @param to to date (exclusive) for the Message.triggerTime
 * @return an NSArray* of Message* objects
 */
- (NSArray*) getMessagesFrom:(NSDate*)from to:(NSDate*)to;


- (void) synchronizeWithServer;
- (BOOL) isSynchronized;
- (void) clearCache;
@end
