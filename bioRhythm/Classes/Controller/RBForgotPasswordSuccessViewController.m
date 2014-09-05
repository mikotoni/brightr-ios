//
//  RBForgotPasswordSuccessViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 7/20/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBForgotPasswordSuccessViewController.h"

#import "RBLoginViewController.h"

@interface RBForgotPasswordSuccessViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buttonGoToLogin;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewCheck;

@end

@implementation RBForgotPasswordSuccessViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBForgotPasswordSuccessViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBForgotPasswordSuccessViewController"];
    
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set round corner button
    _buttonGoToLogin.layer.cornerRadius = 5;
    
    // set border width
    _buttonGoToLogin.layer.borderWidth = 0.5f;
    
    // set border color
    _buttonGoToLogin.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1].CGColor;
    
    // set image view
    [_imageViewCheck setImage:[UIImage imageNamed:@"_checkmark.png"]];
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
- (IBAction)buttonGoToLoginPressed:(id)sender {
    RBLoginViewController *controller = [RBLoginViewController controllerWithStoryBoard:self.storyboard];
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
