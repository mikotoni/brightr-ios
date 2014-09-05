//
//  RBResetPasswordViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 7/20/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBResetPasswordViewController.h"

#import "RBForgotPasswordSuccessViewController.h"
#import "RBLoginViewController.h"

@interface RBResetPasswordViewController ()
@property (strong, nonatomic) IBOutlet UIButton *buttonResetPassword;
@property (strong, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (strong, nonatomic) IBOutlet UILabel *labelUnknownEmail;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewEmail;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewIcon;

@end

@implementation RBResetPasswordViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBResetPasswordViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBResetPasswordViewController"];
    
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set round corner button
    _buttonResetPassword.layer.cornerRadius = 5;
    
    // set image view
    [_imageViewEmail setImage:[UIImage imageNamed:@"textField.png"]];
    [_imageViewIcon setImage:[UIImage imageNamed:@"username.png"]];
    
    // set border image
    
    _imageViewEmail.layer.borderWidth = 1.0;
    _imageViewEmail.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _imageViewEmail.layer.cornerRadius = 5.0;
    
    UIFont* italicFont = [UIFont italicSystemFontOfSize:[UIFont systemFontSize]];
    [_textFieldEmail setValue:italicFont forKeyPath:@"_placeholderLabel.font"];
    
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

- (IBAction)buttonSendInstructionPressed:(id)sender {
    NSString *email = _textFieldEmail.text;
    
    if (email.length == 0) {
        _labelUnknownEmail.text = @"Unknown email address";
    }
    else{
        RBForgotPasswordSuccessViewController *controller = [RBForgotPasswordSuccessViewController controllerWithStoryBoard:self.storyboard];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)dismissKeypad:(id)sender
{
    [_textFieldEmail resignFirstResponder];
}

- (IBAction)buttonBackToLoginPressed:(id)sender
{
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
