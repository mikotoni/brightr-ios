//
//  RBThirdCalIntroViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 8/19/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBThirdCalIntroViewController.h"

#import "RBFirstViewController.h"
#import "RBSecondViewController.h"
#import "RBSecondCalIntroViewController.h"
#import "RBHomeTabBarController.h"

@interface RBThirdCalIntroViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UIButton *buttonCal;
@property (strong, nonatomic) IBOutlet UIButton *buttonSkip;

- (IBAction)buttonSkip:(id)sender;
- (IBAction)buttonCalibrate:(id)sender;

@end

@implementation RBThirdCalIntroViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBThirdCalIntroViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBThirdCalIntroViewController"];
    
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
    
    [_imageView setImage:[UIImage imageNamed:@"006-01.png"]];
    
    // set round corner button
    _buttonCal.layer.cornerRadius = 5;
    _buttonSkip.layer.cornerRadius = 5;
    
    // set border width
    _buttonSkip.layer.borderWidth = 0.5f;
    
    // set border color
    _buttonSkip.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1].CGColor;
    
    UISwipeGestureRecognizer *swiperight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
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

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    RBSecondCalIntroViewController *controller = [RBSecondCalIntroViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:NO];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromLeft;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
}

#pragma mark - action

- (IBAction)buttonCalibrate:(id)sender
{
//    RBSecondViewController *controller = [RBSecondViewController controllerWithStoryBoard:self.storyboard];
//    [self.navigationController pushViewController:controller animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
//    RBSecondViewController *controller = [RBSecondViewController controllerWithStoryBoard:self.storyboard];
//   [self.navigationController pushViewController:controller animated:YES];
    
}

- (IBAction)buttonSkip:(id)sender
{
//    RBPlanNavigationViewController *controller = [RBPlanNavigationViewController controllerWithStoryBoard:self.storyboard];
//    [self.navigationController pushViewController:controller animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //self.tabBarController.selectedIndex = 0;
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
