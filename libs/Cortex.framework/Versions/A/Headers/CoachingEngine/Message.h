//
//  Message.h
//  Cortex
//
//  Created by Pim Nijdam on 14/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import "Coach.h"

typedef enum {
    kMESSAGE_TYPE_START = 0,
    kMESSAGE_TYPE_COMPLETE,
    kMESSAGE_TYPE_SUCCESS,
    kMESSAGE_TYPE_FAIL,
    kMESSAGE_TYPE_ENCOURAGEMENT,
    kMESSAGE_TYPE_REMINDER,
    kMESSAGE_TYPE_TASK_STATUS_UNKNOWN,
} MessageType;

typedef enum {
    kMESSAGE_STYLE_MENTAL,
    kMESSAGE_STYLE_ACTION,
    kMESSAGE_STYLE_FEELING,
    kMESSAGE_STYLE_PHYSICAL,
    
} MessageStyle;


@interface Message : NSObject <NSCopying>

- (id) initWithDictionary:(NSDictionary*) json;
- (BOOL) isEqualToMessage:(Message*) other;

- (NSDictionary*) toServerDictionary;

+ (NSString*) stringFromMessageStyle:(MessageStyle) style;
+ (MessageStyle) messageStyleFromString:(NSString*) string;
+ (NSString*) stringFromMessageType:(MessageType) type;
+ (MessageType) messageTypeFromString:(NSString*) string;

@property (nonatomic, assign) MessageType type;
@property (nonatomic, assign) MessageStyle style;
@property (nonatomic, retain) NSDate* triggerTime;
@property (nonatomic, retain) NSDate* generationTime;

//for displaying
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* notificationText;
@property (nonatomic, retain) NSString* fullText;

//task and coach things...
@property (nonatomic) TaskType taskType;
@property (nonatomic) CoachType coachType;
@property (nonatomic) NSDate* taskStartTime;
@property (nonatomic) id taskTarget;
@property (nonatomic) NSDictionary* value;

//id's of the advise and motivation this message is composed of
@property (nonatomic) long motivationId;
@property (nonatomic) long adviseId;

@end
