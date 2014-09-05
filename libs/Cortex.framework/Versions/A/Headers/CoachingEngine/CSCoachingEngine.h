//
//  CoachingEngine.h
//  Cortex
//
//  Created by Pim Nijdam on 18/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseCoach.h"
#import "SleepDurationCoach.h"
#import "CalibrationCoach.h"
#import "MentalResilienceCoach.h"
#import "Message.h"
#import "MessageDatabase.h"
#import "MessageProxy.h"
#import "Historian.h"
#import "CoachingEngineAPI.h"

/** The coaching engine manages all coaches.
 * This singleton serves as a factory and manager of coaches. It reloads coaches when neccessary and synchronizes with the backend.
 */
@interface CSCoachingEngine : NSObject
///Get the singleton
+ (CSCoachingEngine*) sharedCoachingEngine;
/** Initialize the coaching engine.
 * This function should be called at the start of the application.
 * @param appKey the application key of the application as provided by Sense
 */
- (void) initializeWithAppKey:(NSString*) appKey;


/** Register
 * @param email Email to register
 * @param password plain text password
 * @param success success handler. Called on the main queue
 * @param failure failure handler. Might contain extra info on the error. Called on the main queue
 */
- (void) registerUserWithEmail:(NSString*) email andPassword:(NSString*) password andUserInfo:(NSDictionary*) userInfo success:(void(^)()) success failure:(void(^)(NSError* error)) failure;

/** Login
 * @param username Username to login with
 * @param password plain text password to authenticate the user
 * @param success success handler, called on the main thread
 * @param failure handler. Might contain extra info on the error. Called on the main queue
 */
- (void) loginWithUser:(NSString*) username withPassword:(NSString*) password success:(void(^)()) success failure:(void(^)(NSError* error)) failure;

/** Return the instance for the specified coach type.
 */
- (Coach*) getCoachForType:(CoachType) type;


/** Synchronize the coaching backend with the server.
 * Synchronization is done implicitly and regularly. Use this to force a synchronization immediately.
 */
- (void) synchronizeWithServer;

@property (nonatomic, readonly) CalibrationCoach* calibrationCoach;
@property (nonatomic, readonly) ExerciseCoach* exerciseCoach;
@property (nonatomic, readonly) SleepDurationCoach* sleepDurationCoach;
@property (nonatomic, readonly) MentalResilienceCoach* mentalResilienceCoach;

@property (nonatomic) Historian* historian;
@property (nonatomic, readonly) MessageProxy* messageProxy;
@property (nonatomic, readonly) CoachingEngineAPI* api;
@end
