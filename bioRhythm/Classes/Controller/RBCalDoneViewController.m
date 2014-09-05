//
//  RBCalDoneViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 8/22/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBCalDoneViewController.h"

@interface RBCalDoneViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buttonStart;
@property (strong, nonatomic) IBOutlet UIButton *buttonSelect;

@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;

- (IBAction)buttonStartPressed:(id)sender;
- (IBAction)buttonSelectPressed:(id)sender;


@end

@implementation RBCalDoneViewController

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
    _buttonStart.layer.cornerRadius = 5;
    _buttonSelect.layer.cornerRadius = 5;
    
    // set border width
    _buttonSelect.layer.borderWidth = 0.5f;
    
    // set border color
    _buttonSelect.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action

- (IBAction)buttonStartPressed:(id)sender
{
    
}

- (IBAction)buttonSelectPressed:(id)sender
{
    
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
