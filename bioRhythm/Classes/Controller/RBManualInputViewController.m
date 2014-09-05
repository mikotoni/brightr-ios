//
//  RBManualInputViewController.m
//  Brightr
//
//  Created by Tjaraka Asset on 8/28/14.
//  Copyright (c) 2014 Tjaraka Asset. All rights reserved.
//

#import "RBManualInputViewController.h"

#import "RBFirstViewController.h"
#import "RBWeeksSleepPlanViewController.h"

#import <Cortex/CoachingEngine/CSCoachingEngine.h>

@interface RBManualInputViewController ()

@property (strong, nonatomic) NSArray *arrayHour;
@property (strong, nonatomic) NSArray *arrayMinute;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonClose;
@property (strong, nonatomic) IBOutlet UIButton *buttonStart;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewHour;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewMinute;

- (IBAction)buttonClosePressed:(id)sender;
- (IBAction)buttonStartPressed:(id)sender;

@end

@implementation RBManualInputViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBManualInputViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBManualInputViewController"];
    
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
    
    [_navBar setBarTintColor:[UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1]];
    _navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // set round corner button
    _buttonStart.layer.cornerRadius = 5;
    
    // array jam
    NSArray *dataHour = [[NSArray alloc] initWithObjects:@"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11", @"12", nil];
    
    self.arrayHour = dataHour;
    
    // array minute
    NSArray *dataMinute = [[NSArray alloc] initWithObjects:@"00", @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59", nil];
    
    self.arrayMinute = dataMinute;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES]; //it hides
    [self.tabBarController.tabBar setHidden:YES];
}

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

#pragma  mark - picker data source methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    NSInteger numberOfRows;
    if (component == 0)
    {
        numberOfRows = [_arrayHour count];
    }
    else if (component == 2)
    {
        numberOfRows = [_arrayMinute count];
    }
    else
    {
        numberOfRows = 1;
    }
    return numberOfRows;
    
}

#pragma mark - picker delegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    NSString* title;
    switch (component) {
        case 0:
            title = self.arrayHour[row];
            break;
        case 2:
            title = self.arrayMinute[row];
            break;
        case 1:
            title = @":";
            break;
        default:
            break;
    }
    return title;
    
}

#pragma mark - action
- (IBAction)buttonClosePressed:(id)sender
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    [self.navigationController.view.layer addAnimation:transition
                                                forKey:kCATransition];
    
    RBFirstViewController *controller = [RBFirstViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:NO];
}

- (IBAction)buttonStartPressed:(id)sender
{
    NSInteger hoursRow = [self.sleepDurationPicker selectedRowInComponent:0];
    NSInteger minuteRow = [self.sleepDurationPicker selectedRowInComponent:1];
    
    NSTimeInterval baselineSleep = (hoursRow+1) * 3600 + minuteRow * 60;
    //start sleep coach
    [[CSCoachingEngine sharedCoachingEngine].sleepDurationCoach setPersonalGoalSleepWithBaseline:baselineSleep withDynamic:YES];
    
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    [self.navigationController.view.layer addAnimation:transition
                                                forKey:kCATransition];
    
    RBWeeksSleepPlanViewController *controller = [RBWeeksSleepPlanViewController controllerWithStoryBoard:self.storyboard];
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
