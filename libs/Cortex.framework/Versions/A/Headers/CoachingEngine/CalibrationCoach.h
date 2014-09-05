//
//  CalibrationCoach.h
//  Cortex
//
//  Created by Pim Nijdam on 08/08/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import "Coach.h"

/**
 * The CalibrationCoach computes the baseline values for the Coaches PHYSICAL_ACTIVITY, SLEEP_TIME, MENTAL_RESILIENCE
 *
 * When the CalibrationCoach is finished it's collecting data in the background (with optional requirements), without creating tasks
 * When the CalibrationCoach is already running in the background it will be put in the foreground.
 * A buffer of daily data for 30 days is kept for each sensor.
 * The CalibrationCoach will stop collecting data when he has calculated the average value over 7 days of the selected sensors.
 */
@interface CalibrationCoach : Coach

/** Starts calibrating.
 * If not enough data available the coach will actively start gathering data to calibrate. Once there is enough data the calibration coach
 * will continue to passively (i.e. only listening to already enabled sensors, no extra sensors will be enabled) update the calibration .
 */
- (void) startCalibrating;

/**
 * Get the advised Coach type
 *
 * Based on the current baseline of the user a Coach is advised.
 * If the application has not determined a baseline for the user, then the CalibrationCoach is advised.
 *
 * @return The advised Coach to create or initialize. If no advice is available CoachType NONE is returned.
 */
- (CoachType) getAdvicedCoachType;

#pragma mark - Baselines

/**
* Get the time active baseline
* @return The TimeActive baseline in minutes
*/
- (double) getTimeActiveBaseline;

/**
 * Get the sleep duration baseline
 * @return The sleep duration in hours. If no baseline is available return nan.
 */
- (double) getSleepDurationBaseline;
/**
 * Get the sleep start time baseline
 * @return The sleep start time baseline in hours. If no baseline is available return nan.
 */
- (double) getSleepStartBaseline;

/**
 * Get the sleep end time baseline
 * @return The sleep end time baseline in hours. If no baseline is available return nan.
 */
- (double) getSleepEndBaseline;
/**
 * Get the mental resilience baseline
 * @return The mental resilience baseline in percentage. If no baseline is available return nan.
 */
- (double) getMentalResilienceBaseline;

/**
 * @return whether the time active baseline is complete. I.e. enought information is available for a goodbaseline.
 */
- (BOOL) isTimeActiveBaselineComplete;

/**
 * @return whether the sleep duration baseline is complete. I.e. enought information is available for a goodbaseline.
 */
- (BOOL) isSleepDurationBaselineComplete;

/**
 * @return whether mental resilience baseline is complete. I.e. enought information is available for a goodbaseline.
 */
- (BOOL) isMentalResilienceBaselineComplete;
@end