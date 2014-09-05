//
//  Cortex.h
//  Cortex
//
//  Created by Pim Nijdam on 4/15/13.
//  Copyright (c) 2013 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cortex/FallDetectorModule.h"
#import "Cortex/StepCounterModule.h"
#import "Cortex/TimeActiveModule.h"
#import "Cortex/CarryDeviceModule.h"
#import "Cortex/ActivityModule.h"
#import "Cortex/SitStandModule.h"
#import "Cortex/SleepTimeModule.h"

@interface Cortex : NSObject

+ (Cortex*) sharedCortex;

@property (strong, nonatomic, readonly) FallDetectorModule* fallDetectorModule;
@property (strong, nonatomic, readonly) StepCounterModule* stepCounterModule;
@property (strong, nonatomic, readonly) TimeActiveModule* timeActiveModule;
@property (strong, nonatomic, readonly) CarryDeviceModule* carryDeviceModule;
@property (strong, nonatomic, readonly) ActivityModule* activityModule;
@property (strong, nonatomic, readonly) SitStandModule* sitStandModule;
@property (strong, nonatomic, readonly) SleepTimeModule* sleepTimeModule;
@end
