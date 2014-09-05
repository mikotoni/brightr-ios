//
//  RBWelcomeViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 7/22/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBWelcomeViewController.h"

@interface RBWelcomeViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buttonNewUser;
@property (strong, nonatomic) IBOutlet UIButton *buttonExistingUser;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewTree;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewLogo;

@property (assign) BOOL clicked;

- (IBAction)buttonNewUserPressed:(id)sender;
- (IBAction)buttonExistingUserPressed:(id)sender;

@end

@implementation RBWelcomeViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBWelcomeViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBWelcomeViewController"];
    
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
    //[self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    // set round corner button
    _buttonNewUser.layer.cornerRadius = 5;
    _buttonExistingUser.layer.cornerRadius = 5;
    
    // set border width
    _buttonExistingUser.layer.borderWidth = 0.5f;
    
    // set border color
    _buttonExistingUser.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1].CGColor;
    
    // set image view
    [_imageViewTree setImage:[UIImage imageNamed:@"vitality_tree.png"]];
    [_imageViewLogo setImage:[UIImage imageNamed:@"ASML_logo.png"]];
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

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

#pragma mark - action
- (IBAction)buttonNewUserPressed:(id)sender
{
    if (_clicked == YES) {
        [_buttonNewUser setBackgroundColor:[UIColor colorWithRed:(59/255.0) green:(175/255.0) blue:(218/255.0) alpha:1]];
    }
    else{
        
    }
}

- (IBAction)buttonExistingUserPressed:(id)sender
{
//    _buttonExistingUser.layer.borderColor = [UIColor colorWithRed:(59/255.0) green:(175/255.0) blue:(218/255.0) alpha:1].CGColor;
//    
//    [_buttonExistingUser setTitleColor: [UIColor colorWithRed:(59/255.0) green:(175/255.0) blue:(218/255.0) alpha:1] forState:UIControlStateSelected];
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
