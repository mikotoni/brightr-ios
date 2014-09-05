//
//  RBFirstViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 7/20/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBFirstViewController.h"

#import "RBCalibrationViewController.h"
#import "RBPopUpSleepPlanViewController.h"

#import "UIViewController+ECSlidingViewController.h"

@interface RBFirstViewController ()

@property (strong, nonatomic) IBOutlet UILabel *labelSleepPlan;
@property (strong, nonatomic) IBOutlet UILabel *labelActivityPlan;
@property (strong, nonatomic) IBOutlet UILabel *labelMental;
@property (strong, nonatomic) IBOutlet UILabel *labelBioPlan;

//@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (strong, nonatomic) IBOutlet UIButton *buttonSleep;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewSleep;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewActivity;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewMental;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewBiorhythm;

- (IBAction)buttonSleepPressed:(id)sender;

@end

@implementation RBFirstViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBFirstViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBFirstViewController"];
    
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set image view
    [_imageViewSleep setImage:[UIImage imageNamed:@"_sleep_blue.png"]];
    [_imageViewActivity setImage:[UIImage imageNamed:@"_activity_orange.png"]];
    [_imageViewMental setImage:[UIImage imageNamed:@"_mind_green.png"]];
    [_imageViewBiorhythm setImage:[UIImage imageNamed:@"_shift_red.png"]];
    
//    // set label icon color
//    self.labelSleepIcon.backgroundColor = [UIColor colorWithRed:(47/255.0) green:(50/255.0) blue:(191/255.0) alpha:1];
//    self.labelActivityIcon.backgroundColor = [UIColor colorWithRed:(191/255.0) green:(188/255.0) blue:(47/255.0) alpha:1];
//    self.labelMentalIcon.backgroundColor = [UIColor colorWithRed:(97/255.0) green:(65/255.0) blue:(38/255.0) alpha:1];
//    self.labelBioIcon.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
//    
//    // set label text color
//    self.labelSleepPlan.textColor = [UIColor colorWithRed:(47/255.0) green:(50/255.0) blue:(191/255.0) alpha:1];
//    self.labelActivityPlan.textColor = [UIColor colorWithRed:(191/255.0) green:(188/255.0) blue:(47/255.0) alpha:1];
//    self.labelMental.textColor = [UIColor colorWithRed:(97/255.0) green:(65/255.0) blue:(38/255.0) alpha:1];
//    self.labelBioPlan.textColor = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    
    [self.tabBarController.tabBar setHidden:NO];
    
    self.navigationItem.hidesBackButton = YES;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1]];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
//    self.tabBarController.tabBar.barTintColor =  [UIColor colorWithRed:(59/255.0) green:(175/255.0) blue:(218/255.0) alpha:1];
//    
//        [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    
    [self.navigationController setNavigationBarHidden:NO];    // it shows nav bar

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.slidingViewController.topViewController.view addGestureRecognizer:self.slidingViewController.panGesture];
    self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];   //it hides
//    self.tabBarController.tabBar.tintColor = [UIColor redColor];
//}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];    // it shows
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action

//- (IBAction)buttonMenuPressed:(id)sender {
//    [self.slidingViewController anchorTopViewToRightAnimated:YES];
//}

- (IBAction)buttonSleepPressed:(id)sender
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    [self.navigationController.view.layer addAnimation:transition
                                                forKey:kCATransition];
    
    RBPopUpSleepPlanViewController *controller = [RBPopUpSleepPlanViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:NO];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
