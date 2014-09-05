//
//  SleepDurationCoach.h
//  Cortex
//
//  Created by Pim Nijdam on 05/08/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import "Coach.h"

@interface SleepDurationCoach : Coach

/** Set the goal to a manually specified goal.
 * @param sleepPerDay goal time (in seconds) to sleep each day.
 */
- (void) setManualGoalDailySleep:(NSTimeInterval) sleepPerDay;

/** Set the personal goal.
 * @param baseline baseline sleep time (in seconds) per day
 */
- (void) setPersonalGoalSleepWithBaseline: (NSTimeInterval) baseline withDynamic:(BOOL)dynamic;

/** Set a population based goal.
 * @param dynamic Whether the coach should adjust it's goals based upon the progress the user is making
 */
- (void) setPopulationGoalWithDynamic:(BOOL)dynamic;

/** Return the set goal.
 * @return the goal time (in seconds) to sleep each day
 */
- (NSTimeInterval) getGoal;
@end
