//
//  CoachingEngineAPI.h
//  Cortex
//
//  Created by Pim Nijdam on 24/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Message.h"
#import "Task.h"

@interface CoachingEngineAPI : NSObject

- (BOOL) postMessage:(Message*)message;
- (BOOL) putTask:(Task*)task;

- (NSDate*) getMotivationMessagesEditDate;
- (NSArray*) getMotivationMessages;

- (NSDate*) getAdviceMessagesEditDate;
- (NSArray*) getAdviceMessages;

- (void) registerUserWithEmail:(NSString*) email andPassword:(NSString*) password andUserInfo:(NSDictionary*) userInfo success:(void(^)()) success failure:(void(^)(NSError* error)) failure;

@property NSString* applicationKey;
@end
