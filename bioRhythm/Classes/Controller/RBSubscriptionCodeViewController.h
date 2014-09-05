//
//  RBSubscriptionCodeViewController.h
//  bioRhythm
//
//  Created by defindal irvan on 7/20/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBSubscriptionCodeViewController : UIViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollerSubscription;

-(IBAction)textFieldReturn:(id)sender;

@end
