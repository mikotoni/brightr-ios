//
//  RBAppDelegate.m
//  bioRhythm
//
//  Created by defindal irvan on 7/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "RBAppDelegate.h"
#import <Cortex/Cortex.h>
#import <Cortex/CoachingEngine/CSCoachingEngine.h>
#import <Cortex/CSSensePlatform.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static NSString* const appKey =@"12345678901234567890123456789012";

@implementation RBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //tint color for tabbar
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    
    //tint color for the text of inactive tabbar item.
    //[[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    
    //tint color for the text of selected tabbar item.
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    //tint color for the selected tabbar item.
//    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
//    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setSelectionIndicatorImage:[self imageWithColor:UIColorFromRGB(0x3BAFDA)]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    [self initializeCoachingEngine];
    return YES;
}
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 64.0f, 49.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
-(void) onNewMessage: (NSNotification*) notification {
    Message* msg = notification.userInfo[@"message"];
    NSLog(@"Got message for task %d with text: \"%@\"", msg.taskType, msg.fullText);
    
    if (msg.notificationText == nil) {
        //only display message if there is some text to display
        return;
    }
    
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive) {
        dispatch_async(dispatch_get_main_queue(), ^() {
            NSString* text = [NSString stringWithFormat:@"%@", msg.fullText];
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:msg.title message:text delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles: nil];
            [alert show];
        });
        
    } else {
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = nil;
        localNotification.alertAction = @"Show me more";
        localNotification.alertBody = [NSString stringWithFormat:@"%@", msg.notificationText];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

- (void) initializeCoachingEngine {
    
    //Note: Important to subscribe to notifications before initializing the coaching engine, as the coaching eninge will enable active coaches and they might immediately start sending messages
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNewMessage:) name:kCORTEX_COACHING_ENGINE_NEW_MESSAGE_NOTIFICATION object:nil];
    
    //initialize the coaching engine
    [[CSCoachingEngine sharedCoachingEngine] initializeWithAppKey:appKey];
    
    NSString* consumerName = @"nl.sense.brightr";
    NSArray* commonRequirements = @[//location sensor is needed so that we keep running in the background
                                    @{kCSREQUIREMENT_FIELD_SENSOR_NAME:kCSSENSOR_LOCATION, kCSREQUIREMENT_FIELD_SAMPLE_ACCURACY:@(10000)},
                                    //Couple of sensors that can be usefull and virtually don't consume power
                                    @{kCSREQUIREMENT_FIELD_SENSOR_NAME:kCSSENSOR_BATTERY},
                                    @{kCSREQUIREMENT_FIELD_SENSOR_NAME:kCSSENSOR_CONNECTION_TYPE},
                                    //Screen state is used so that we can disable sampling audio when the screen is active (and an annoying notification bar would appear)
                                    @{kCSREQUIREMENT_FIELD_SENSOR_NAME:kCSSENSOR_SCREEN_STATE},
                                    ];
    [[CSSensorRequirements sharedRequirements] setRequirements:commonRequirements byConsumer:consumerName];
    
    //disable uploading to common sense as the dev server is broken and this causes annoying error messages. TODO: enable
    [[CSSettings sharedSettings] setSettingType:kCSSettingTypeGeneral setting:kCSGeneralSettingUploadToCommonSense value:kCSSettingNO];
    
    //Set the upload rate
    [[CSSettings sharedSettings] setSettingType:kCSSettingTypeGeneral setting:kCSGeneralSettingUploadInterval value:@"7200"];
    
    //enable the background restart hack so that the app will restart automatically when it's not running
    [[CSSettings sharedSettings] setSettingType:kCSSettingTypeGeneral setting:kCSGeneralSettingBackgroundRestarthack value:kCSSettingYES];
    
    /// TODO: place this code somewhere else, this is just some example code
    
    //set the goals for the coaches
    [[CSCoachingEngine sharedCoachingEngine].exerciseCoach setPersonalGoalDailyExerciseWithBaseline:30*60 withDynamic:YES];
    [[CSCoachingEngine sharedCoachingEngine].mentalResilienceCoach setPersonalGoalWithBaseline:50 withDynamic:YES];
    [[CSCoachingEngine sharedCoachingEngine].sleepDurationCoach setPersonalGoalSleepWithBaseline:6*3600 withDynamic:YES];
    
    Historian* historian = [CSCoachingEngine sharedCoachingEngine].historian;
    //get all messages for the last 24h
    NSDate* now = [NSDate date];
    NSArray* messages = [historian getMessagesFrom:[now dateByAddingTimeInterval:-24*60*60] to:now];
    NSLog(@"Got %lu messages.", (unsigned long)messages.count);
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [CSSensePlatform willTerminate];
}

@end
