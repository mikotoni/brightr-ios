//
//  MentalResilienceCoach.h
//  Cortex
//
//  Created by Pim Nijdam on 01/09/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import "Coach.h"

@interface MentalResilienceCoach : Coach

/** Set the goal to a manually specified goal.
 * @param goalMentalResilience goal mental resilience for each day
 */
- (void) setManualGoal:(double) goalMentalResilience;

/** Set a personal based goal.
 * @param baseline baseline mental resilience
 * @param dynamic Whether the coach should adjust it's goals based upon the progress the user is making
 */
- (void) setPersonalGoalWithBaseline:(double) baseline withDynamic:(BOOL)dynamic;

/** Set a population based goal.
 * @param dynamic Whether the coach should adjust it's goals based upon the progress the user is making
 */
- (void) setPopulationGoalWithDynamic:(BOOL)dynamic;

/** Return the set goal.
 * @return the goal mental resilience
 */
- (double) getGoal;

- (void) addMentalResilienceMeasurement:(double) measured;
@end
