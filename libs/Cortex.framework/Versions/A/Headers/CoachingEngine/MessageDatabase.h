//
//  MessageDatabase.h
//  Cortex
//
//  Created by Pim Nijdam on 23/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "Coach.h"

@interface AdviseMsg : NSObject <NSCopying>

- (BOOL) isEqualToAdviseMsg:(AdviseMsg*) other;

@property long identifier;
@property TaskType taskType;
@property CoachType coachType;
@property MessageStyle style;
@property MessageType msgType;

@property NSString* title;
@property NSString* notification;
@property NSString* fullText;
@end

@interface MotivationMsg : NSObject <NSCopying>

- (BOOL) isEqualToMotivationMsg:(MotivationMsg*) other;

@property long identifier;
@property TaskType taskType;
@property MessageStyle style;
@property MessageType msgType;

@property NSString* title;
@property NSString* notification;
@property NSString* fullText;
@end


@interface MessageDatabase : NSObject
/** Initialize and open database */
- (id) initWithPath:(NSString*) databaseFilePath;
/** Query for advise messages. */
- (NSArray*) getAdviseMessagesForTask:(TaskType) taskType andCoach:(CoachType) coachType withType:(MessageType) msgType andStyle:(MessageStyle) style;
/** Query for motivation message. */
- (MotivationMsg*) getMotivationMessageForTask:(TaskType) taskType withType:(MessageType) msgType andStyle:(MessageStyle) style;

- (void) setMotivationMessages:(NSArray*) styleMessages;
- (void) setAdviseMessages:(NSArray*) adviseMessages;

- (void) clear;
@end
