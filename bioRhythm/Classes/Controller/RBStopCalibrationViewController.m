//
//  RBStopCalibrationViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 8/22/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBStopCalibrationViewController.h"

#import "RBCalibrationViewController.h"
#import "RBFirstViewController.h"

@interface RBStopCalibrationViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buttonStop;
@property (strong, nonatomic) IBOutlet UIButton *buttonCancel;

@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;

- (IBAction)buttonStopPressed:(id)sender;
- (IBAction)buttonCancelPressed:(id)sender;


@end

@implementation RBStopCalibrationViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBStopCalibrationViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBStopCalibrationViewController"];
    
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
    
    [_navigationBar setBarTintColor:[UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1]];
    _navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // set round corner button
    _buttonStop.layer.cornerRadius = 5;
    _buttonCancel.layer.cornerRadius = 5;
    
    // set border width
    _buttonCancel.layer.borderWidth = 0.5f;
    
    // set border color
    _buttonCancel.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1].CGColor;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action

- (IBAction)buttonStopPressed:(id)sender
{
    RBFirstViewController *controller = [RBFirstViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)buttonCancelPressed:(id)sender
{
    RBCalibrationViewController *controller = [RBCalibrationViewController controllerWithStoryBoard:self.storyboard];
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
