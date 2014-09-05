//
//  RBFirstCalIntroViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 8/19/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBFirstCalIntroViewController.h"

#import "RBSecondCalIntroViewController.h"

@interface RBFirstCalIntroViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UIButton *buttonCal;

@end

@implementation RBFirstCalIntroViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBFirstCalIntroViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBFirstCalIntroViewController"];
    
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
    
    // set image view
    [_imageView setImage:[UIImage imageNamed:@"004-01.png"]];
    
    // set round corner button
    _buttonCal.layer.cornerRadius = 5;
    
    // set border width
    _buttonCal.layer.borderWidth = 0.5f;
    
    // set border color
    _buttonCal.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1].CGColor;
    
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
    RBSecondCalIntroViewController *controller = [RBSecondCalIntroViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:NO];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromRight;
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
