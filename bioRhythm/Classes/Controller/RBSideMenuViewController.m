//
//  RBSideMenuViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 7/25/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBSideMenuViewController.h"

#import "RBMenuCustomCell.h"

#import "UIViewController+ECSlidingViewController.h"

@interface RBSideMenuViewController ()

@property (strong, nonatomic) IBOutlet UITableView *sideMenu;
@property (strong, nonatomic) NSString *text;

@end

@implementation RBSideMenuViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard withText:(NSString *)text{
    RBSideMenuViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBSideMenuViewController"];
    controller.text = text;
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.sideMenu registerNib:[UINib nibWithNibName:@"RBMenuCustomCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier: @"RBMenuCustomCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//
//    return 5;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        return 5;
    }
    //    }else if (section == 1) {
    //        return 1;
    //    }else if (section == 2) {
    //        return 3;
    //    }else if (section == 3){
    //        return 1;
    //    }else if (section == 4){
    //        return 2;
    //    }
    return 0;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (section == 0){
//        return 4;
//    }else if (section == 1) {
//        return 1;
//    }else if (section == 2) {
//        return 3;
//    }else if (section == 3){
//        return 1;
//    }else if (section == 4){
//        return 2;
//    }
//    //    } else if (section == 1) {
//    //        return 3;
//    //    } else if (section == 2) {
//    //        return 2;
//    //    }
//    return 0;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        RBMenuCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RBMenuCustomCell"];
        
        switch (indexPath.row) {
            case 0:
                cell.labelMenu.text = @"Manage sleep plan";
                break;
            case 1:
                cell.labelMenu.text = @"Events calendar";
                break;
            case 2:
                cell.labelMenu.text = @"Human coach";
                break;
            case 3:
                cell.labelMenu.text = @"Settings";
                break;
            case 4:
                cell.labelMenu.text = @"Support";
                break;
            default:
                break;
        }
        
        return cell;
    }
    
    //    }else if (indexPath.section == 1) {
    //        static NSString *CellIdentifier = @"RBFirstTitleCell";
    //
    //        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //        if (cell == nil) {
    //            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
    //                                          reuseIdentifier:CellIdentifier];
    //        }
    //
    //        cell.textLabel.text = @"ASML";
    //
    //        return cell;
    //
    //    }else if (indexPath.section == 2) {
    //        RBMenuCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RBMenuCustomCell"];
    //
    //        switch (indexPath.row) {
    //            case 0:
    //                cell.labelMenu.text = @"Viltality Blog";
    //                break;
    //            case 1:
    //                cell.labelMenu.text = @"Events";
    //                break;
    //            case 2:
    //                cell.labelMenu.text = @"Start Shift Work Program";
    //                break;
    //
    //            default:
    //                break;
    //        }
    //        return cell;
    //
    //    }else if (indexPath.section == 3) {
    //        static NSString *CellIdentifier = @"RBSecondTitleCell";
    //
    //        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //        if (cell == nil) {
    //            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
    //                                          reuseIdentifier:CellIdentifier];
    //        }
    //
    //        cell.textLabel.text = @"Other";
    //
    //        return cell;
    //
    //    }else if (indexPath.section == 4) {
    //        RBMenuCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RBMenuCustomCell"];
    //
    //        switch (indexPath.row) {
    //            case 0:
    //                cell.labelMenu.text = @"Settings";
    //                break;
    //            case 1:
    //                cell.labelMenu.text = @"Support";
    //                break;
    //
    //            default:
    //                break;
    //        }
    //        return cell;
    //    }
    
    return nil;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RBSleepPlanViewController"];
                break;
            case 1:
                self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RBFirstHomeNavigationController"];
                break;
            case 2:
                self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RBFirstHomeNavigationController"];
                break;
            case 3:
                self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RBFirstHomeNavigationController"];
                break;
            case 4:
                self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RBFirstHomeNavigationController"];
                break;
            default:
                break;
        }
        
        [self.slidingViewController resetTopViewAnimated:YES];
    }
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
