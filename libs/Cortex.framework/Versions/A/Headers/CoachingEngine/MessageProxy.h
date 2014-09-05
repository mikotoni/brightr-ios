//
//  MessageProxy.h
//  Cortex
//
//  Created by Pim Nijdam on 29/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoachingEngineAPI.h"
#import "Message.h"
#import "MessageDatabase.h"

@interface MessageProxy : NSObject
- (id) initWithAPI:(CoachingEngineAPI*) apiParam;
- (void) update;
- (NSArray*) getAdviseMessagesForTask:(TaskType) taskType andCoach:(CoachType) coachType withType:(MessageType) msgType andStyle:(MessageStyle) style;
- (MotivationMsg*) getMotivationMessageForTask:(TaskType) taskType withType:(MessageType) msgType andStyle:(MessageStyle) style;
- (void) clearCache;
@end
