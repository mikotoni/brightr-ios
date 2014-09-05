//
//  Psychologist.h
//  Cortex
//
//  Created by Pim Nijdam on 18/07/14.
//  Copyright (c) 2014 Sense Observation Systems BV. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Message;

@interface Psychologist : NSObject

+ (Psychologist*) sharedPsychologist;
- (void) fillMessage:(Message*) msg;
@end
