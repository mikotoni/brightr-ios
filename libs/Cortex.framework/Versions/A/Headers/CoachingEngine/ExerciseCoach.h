//
//  ExerciseCoach.h
//  Cortex
//
//  Created by Pim Nijdam on 17/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import "Coach.h"

/** The exercise coach coaches a user to be more active.
 * The exercise coach automatically measures the users physical activity and depending on the goal will give advise on how to improve.
 */
@interface ExerciseCoach : Coach
- (id) init;

/** Set the goal to a manually specified goal.
 * @param exercisePerDay goal time (in seconds) to exercise each day.
 */
- (void) setManualGoalDailyExercise:(NSTimeInterval) exercisePerDay;

/** Set a personal based goal.
 * @param baseline baseline daily exercise in seconds per day
 * @param dynamic Whether the coach should adjust it's goals based upon the progress the user is making
 */
- (void) setPersonalGoalDailyExerciseWithBaseline: (NSTimeInterval) baseline withDynamic:(BOOL)dynamic;

/** Set a population based goal.
 * @param dynamic Whether the coach should adjust it's goals based upon the progress the user is making
 */
- (void) setPopulationGoalWithDynamic:(BOOL)dynamic;

/** Return the set goal.
 * @return the goal time (in seconds) to exercise each day
 */
- (NSTimeInterval) getGoal;
@end
