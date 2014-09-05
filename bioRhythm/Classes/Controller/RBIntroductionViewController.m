//
//  RBIntroductionViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 7/22/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBIntroductionViewController.h"

#import "RBSecondIntroductionViewController.h"

@interface RBIntroductionViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buttonImIn;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation RBIntroductionViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBIntroductionViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBIntroductionViewController"];
    
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set round corner button
    _buttonImIn.layer.cornerRadius = 5;
    
    // set border width
    _buttonImIn.layer.borderWidth = 0.5f;
    
    // set border color
    _buttonImIn.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1].CGColor;
    
    // set image view
    [_imageView setImage:[UIImage imageNamed:@"all_plans.png"]];

    UISwipeGestureRecognizer *swipeleft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
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
    RBSecondIntroductionViewController *controller = [RBSecondIntroductionViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:NO];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
}


#pragma mark - action

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
