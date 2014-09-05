//
//  RBWeeksSleepPlanViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 8/22/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBWeeksSleepPlanViewController.h"
#import <Cortex/CoachingEngine/CSCoachingEngine.h>

@interface RBWeeksSleepPlanViewController ()

// weeks chart
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar0;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar1;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar2;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar3;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar4;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar5;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar6;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar7;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar8;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar9;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar10;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar11;
@property (strong, nonatomic) IBOutlet UILabel *labelWeeksBar12;

@property (strong, nonatomic) IBOutlet UILabel *labelSleepTime;
@property (strong, nonatomic) IBOutlet UILabel *labelGoalTime;
@property (strong, nonatomic) IBOutlet UILabel *labelPerfPercent;

@property (strong, nonatomic) IBOutlet UILabel *labelFirst;
@property (strong, nonatomic) IBOutlet UILabel *labelSecond;

@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControlWeeks;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewFirst;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewSecond;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewThird;

- (IBAction)segmentedControlAction:(id)sender;

@end

@implementation RBWeeksSleepPlanViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBWeeksSleepPlanViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBWeeksSleepPlanViewController"];
    
    return controller;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tabBarController.tabBar setHidden:NO];
    
    [_navigationBar setBarTintColor:[UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1]];
    _navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // set image view
    [_imageViewFirst setImage:[UIImage imageNamed:@"_clock.png"]];
    [_imageViewSecond setImage:[UIImage imageNamed:@"_goal.png"]];
    [_imageViewThird setImage:[UIImage imageNamed:@"_performance.png"]];
    
    // weeks chart
    self.labelWeeksBar0.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar0.text = @"";
    self.labelWeeksBar0.frame = CGRectMake(15, 146, 13, -38);
    
    self.labelWeeksBar1.backgroundColor = [UIColor colorWithRed:(46/255.0) green:(122/255.0) blue:(191/255.0) alpha:1];
    self.labelWeeksBar1.text = @"";
    self.labelWeeksBar1.frame = CGRectMake(38, 146, 13, -35);
    
    //self.labelWeeksBar2.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar2.text = @"";
    self.labelWeeksBar2.frame = CGRectMake(61, 146, 13, -38);
    
    //self.labelWeeksBar3.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar3.text = @"";
    self.labelWeeksBar3.frame = CGRectMake(84, 146, 13, -38);
    
    //self.labelWeeksBar4.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar4.text = @"";
    self.labelWeeksBar4.frame = CGRectMake(107, 146, 13, -38);
    
    //self.labelWeeksBar5.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar5.text = @"";
    self.labelWeeksBar5.frame = CGRectMake(130, 146, 13, -38);
    
    //self.labelWeeksBar6.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar6.text = @"";
    self.labelWeeksBar6.frame = CGRectMake(153, 146, 13, -38);
    
    //self.labelWeeksBar7.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar7.text = @"";
    self.labelWeeksBar7.frame = CGRectMake(176, 146, 13, -38);
    
    //self.labelWeeksBar8.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar8.text = @"";
    self.labelWeeksBar8.frame = CGRectMake(199, 146, 13, -38);
    
    //self.labelWeeksBar9.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar9.text = @"";
    self.labelWeeksBar9.frame = CGRectMake(220, 146, 13, -38);
    
    //self.labelWeeksBar10.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar10.text = @"";
    self.labelWeeksBar10.frame = CGRectMake(240, 146, 13, -38);
    
    //self.labelWeeksBar11.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar11.text = @"";
    self.labelWeeksBar11.frame = CGRectMake(263, 146, 13, -38);
    
    //self.labelWeeksBar12.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1];
    self.labelWeeksBar12.text = @"";
    self.labelWeeksBar12.frame = CGRectMake(286, 146, 13, -38);
    
    // bold font in segmented control
    UIFont *font = [UIFont boldSystemFontOfSize:12.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [self.segmentedControlWeeks setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self segmentedControlAction:nil];
}

#pragma mark - action
- (IBAction)segmentedControlAction:(UISegmentedControl *)sender
{
    NSInteger selectedSegment = _segmentedControlWeeks.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        SleepDurationCoach* coach = [CSCoachingEngine sharedCoachingEngine].sleepDurationCoach;
        //todays sleep time. Get it using the last task value
        //TODO: how to exactly get it? value from yesterday? last 24h, what about a non-completed task?
        NSDate* end = [NSDate date];
        NSDate* start = [end dateByAddingTimeInterval:-24*3600];
        NSArray* pastTasks = [coach getPastTasksFrom:start to:end];
        Task* lastNight = [pastTasks lastObject];
        
        
        NSString* lastNightString = @"--:--";
        NSString* percentString = @"--";
        if (lastNight.value != nil) {
            NSTimeInterval lastNightSleep = [[lastNight.value valueForKey:@"value"] doubleValue];
            lastNightString = timeStringFromDuration(lastNightSleep);
            percentString = [NSString stringWithFormat:@"%02.0f%%", MIN(100, lastNightSleep / [coach getGoal]) ];
        }
        
        [self.labelFirst setText:@"Slept last night"];
        [self.labelSecond setText:@"Goal"];
        
        [self.labelSleepTime setText:lastNightString];
        [self.labelGoalTime setText:timeStringFromDuration([coach getGoal])];
        [self.labelPerfPercent setText:percentString];
        
        // set image view
        [_imageViewFirst setImage:[UIImage imageNamed:@"_clock.png"]];
        [_imageViewSecond setImage:[UIImage imageNamed:@"_goal.png"]];
        [_imageViewThird setImage:[UIImage imageNamed:@"_performance.png"]];
        
    }
    else{
        [self.labelSleepTime setText:@"6:10"];
        [self.labelGoalTime setText:@"4:57"];
        [self.labelPerfPercent setText:@"76%"];
        
        [self.labelFirst setText:@"Week goal"];
        [self.labelSecond setText:@"Average per night"];
        
        [_imageViewFirst setImage:[UIImage imageNamed:@"_goal.png"]];
        [_imageViewSecond setImage:[UIImage imageNamed:@"_clock.png"]];
        [_imageViewThird setImage:[UIImage imageNamed:@"_performance.png"]];
    }
}

static NSString* timeStringFromDuration(NSTimeInterval dt) {
    //round to minute before anything else
    NSInteger secs = (NSInteger)round(dt / 60)*60;
    NSInteger hours = secs / 3600;
    NSInteger minutes =(secs - hours*3600) / 60;
    return [NSString stringWithFormat:@"%02i:%02i", hours, minutes];
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
