//
//  RBCalibrationViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 8/8/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBCalibrationViewController.h"

#import "UIViewController+ECSlidingViewController.h"

#import "RBStopCalibrationViewController.h"

@interface RBCalibrationViewController ()

@property (strong, nonatomic) IBOutlet UILabel *labelSleep;
@property (strong, nonatomic) IBOutlet UILabel *labelSleepTime;

@property (strong, nonatomic) IBOutlet UILabel *labelActivity;
@property (strong, nonatomic) IBOutlet UILabel *labelActivityTime;

@property (strong, nonatomic) IBOutlet UILabel *labelMental;
@property (strong, nonatomic) IBOutlet UILabel *labelMentalTime;

@property (strong, nonatomic) IBOutlet UIProgressView *progressViewCalibration;

@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButtonStop;

// calendar
@property (strong, nonatomic) IBOutlet UILabel *labelFirstDay;
@property (strong, nonatomic) IBOutlet UILabel *labelSecondDay;
@property (strong, nonatomic) IBOutlet UILabel *labelThirdDay;
@property (strong, nonatomic) IBOutlet UILabel *labelFourthDay;
@property (strong, nonatomic) IBOutlet UILabel *labelFifthDay;
@property (strong, nonatomic) IBOutlet UILabel *labelSixthDay;
@property (strong, nonatomic) IBOutlet UILabel *labelSeventhDay;

@property (strong, nonatomic) IBOutlet UILabel *labelFirstNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelSecondNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelThirdNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelFourthNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelFifthNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelSixthNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelSeventhNumber;

// bar chart
@property (strong, nonatomic) IBOutlet UILabel *labelSleepBar1;
@property (strong, nonatomic) IBOutlet UILabel *labelSleepBar2;
@property (strong, nonatomic) IBOutlet UILabel *labelSleepBar3;
@property (strong, nonatomic) IBOutlet UILabel *labelSleepBar4;
@property (strong, nonatomic) IBOutlet UILabel *labelSleepBar5;
@property (strong, nonatomic) IBOutlet UILabel *labelSleepBar6;
@property (strong, nonatomic) IBOutlet UILabel *labelSleepBar7;

@property (strong, nonatomic) IBOutlet UILabel *labelActivityBar1;
@property (strong, nonatomic) IBOutlet UILabel *labelActivityBar2;
@property (strong, nonatomic) IBOutlet UILabel *labelActivityBar3;
@property (strong, nonatomic) IBOutlet UILabel *labelActivityBar4;
@property (strong, nonatomic) IBOutlet UILabel *labelActivityBar5;
@property (strong, nonatomic) IBOutlet UILabel *labelActivityBar6;
@property (strong, nonatomic) IBOutlet UILabel *labelActivityBar7;

@property (strong, nonatomic) IBOutlet UILabel *labelMentalBar1;
@property (strong, nonatomic) IBOutlet UILabel *labelMentalBar2;
@property (strong, nonatomic) IBOutlet UILabel *labelMentalBar3;
@property (strong, nonatomic) IBOutlet UILabel *labelMentalBar4;
@property (strong, nonatomic) IBOutlet UILabel *labelMentalBar5;
@property (strong, nonatomic) IBOutlet UILabel *labelMentalBar6;
@property (strong, nonatomic) IBOutlet UILabel *labelMentalBar7;

- (IBAction)buttonStopPressed:(id)sender;

@end

@implementation RBCalibrationViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBCalibrationViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBCalibrationViewController"];
    
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_navigationBar setBarTintColor:[UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1]];
    _navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    _barButtonStop.tintColor = [UIColor whiteColor];
    
    UIFont *font = [UIFont boldSystemFontOfSize:16.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [self.barButtonStop setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    // set label text color
    self.labelSleep.textColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelSleepTime.textColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    
    self.labelActivity.textColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    self.labelActivityTime.textColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    
    self.labelMental.textColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    self.labelMentalTime.textColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    
    // set label text
    self.labelSleepTime.text = @"6:39 h";
    self.labelActivityTime.text = @"1:20 h";
    self.labelMentalTime.text = @"75 %";
    
    // set progress view
    self.progressViewCalibration.progress=0.42f;
    
    // set bar chart
    
    // sleep bar
    self.labelSleepBar1.backgroundColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelSleepBar1.text = @"";
    self.labelSleepBar1.frame = CGRectMake(164, 275, 13, -35);
    
    self.labelSleepBar2.backgroundColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelSleepBar2.text = @"";
    self.labelSleepBar2.frame = CGRectMake(186, 275, 13, -50);
    
    self.labelSleepBar3.backgroundColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelSleepBar3.text = @"";
    self.labelSleepBar3.frame = CGRectMake(208, 275, 13, -30);
    
    self.labelSleepBar4.backgroundColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelSleepBar4.text = @"";
    self.labelSleepBar4.frame = CGRectMake(230, 275, 13, -20);
    
    self.labelSleepBar5.backgroundColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelSleepBar5.text = @"";
    self.labelSleepBar5.frame = CGRectMake(252, 275, 13, -25);
    
    self.labelSleepBar6.backgroundColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelSleepBar6.text = @"";
    self.labelSleepBar6.frame = CGRectMake(274, 275, 13, -10);
    
    self.labelSleepBar7.backgroundColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelSleepBar7.text = @"";
    self.labelSleepBar7.frame = CGRectMake(296, 275, 13, -15);
    
    // activity bar
    self.labelActivityBar1.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    self.labelActivityBar1.text = @"";
    self.labelActivityBar1.frame = CGRectMake(163, 381, 13, -35);
    
    self.labelActivityBar2.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    self.labelActivityBar2.text = @"";
    self.labelActivityBar2.frame = CGRectMake(186, 381, 13, -50);
    
    self.labelActivityBar3.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    self.labelActivityBar3.text = @"";
    self.labelActivityBar3.frame = CGRectMake(208, 381, 13, -30);
    
    self.labelActivityBar4.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    self.labelActivityBar4.text = @"";
    self.labelActivityBar4.frame = CGRectMake(230, 381, 13, -20);
    
    self.labelActivityBar5.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    self.labelActivityBar5.text = @"";
    self.labelActivityBar5.frame = CGRectMake(252, 381, 13, -25);
    
    self.labelActivityBar6.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    self.labelActivityBar6.text = @"";
    self.labelActivityBar6.frame = CGRectMake(274, 381, 13, -10);
    
    self.labelActivityBar7.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(142/255.0) blue:(8/255.0) alpha:1];
    self.labelActivityBar7.text = @"";
    self.labelActivityBar7.frame = CGRectMake(296, 381, 13, -15);
    
    // mental bar
    self.labelMentalBar1.backgroundColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    self.labelMentalBar1.text = @"";
    self.labelMentalBar1.frame = CGRectMake(163, 487, 13, -35);
    
    self.labelMentalBar2.backgroundColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    self.labelMentalBar2.text = @"";
    self.labelMentalBar2.frame = CGRectMake(186, 487, 13, -50);
    
    self.labelMentalBar3.backgroundColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    self.labelMentalBar3.text = @"";
    self.labelMentalBar3.frame = CGRectMake(208, 487, 13, -30);
    
    self.labelMentalBar4.backgroundColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    self.labelMentalBar4.text = @"";
    self.labelMentalBar4.frame = CGRectMake(230, 487, 13, -20);
    
    self.labelMentalBar5.backgroundColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    self.labelMentalBar5.text = @"";
    self.labelMentalBar5.frame = CGRectMake(252, 487, 13, -25);
    
    self.labelMentalBar6.backgroundColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    self.labelMentalBar6.text = @"";
    self.labelMentalBar6.frame = CGRectMake(274, 487, 13, -10);
    
    self.labelMentalBar7.backgroundColor = [UIColor colorWithRed:(37/255.0) green:(119/255.0) blue:(45/255.0) alpha:1];
    self.labelMentalBar7.text = @"";
    self.labelMentalBar7.frame = CGRectMake(296, 487, 13, -15);
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];    // it shows
//}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.slidingViewController.topViewController.view addGestureRecognizer:self.slidingViewController.panGesture];
    self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (IBAction)buttonStopPressed:(id)sender
{
    RBStopCalibrationViewController *controller = [RBStopCalibrationViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:YES];
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
