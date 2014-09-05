//
//  RBSecondIntroductionViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 8/19/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBSecondIntroductionViewController.h"

#import "RBIntroductionViewController.h"
#import "RBThirdIntroductionViewController.h"

@interface RBSecondIntroductionViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buttonGotIt;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewSecondIntro;

@end

@implementation RBSecondIntroductionViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBSecondIntroductionViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBSecondIntroductionViewController"];
    
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
    
    [_imageViewSecondIntro setImage:[UIImage imageNamed:@"002-01.png"]];
    
    // set round corner button
    _buttonGotIt.layer.cornerRadius = 5;
    
    // set border width
    _buttonGotIt.layer.borderWidth = 0.5f;
    
    // set border color
    _buttonGotIt.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1].CGColor;
    
    UISwipeGestureRecognizer *swipeleft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
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

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    RBThirdIntroductionViewController *controller = [RBThirdIntroductionViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:NO];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    RBIntroductionViewController *controller = [RBIntroductionViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:NO];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromLeft;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
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
