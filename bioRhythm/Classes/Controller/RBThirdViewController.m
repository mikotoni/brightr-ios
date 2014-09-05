//
//  RBThirdViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 8/5/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBThirdViewController.h"

#import "RBBlogCustomCell.h"
#import "UIViewController+ECSlidingViewController.h"
#import "RBWebServices.h"
#import "UIImageView+AFNetworking.h"
#import "UIScrollView+BottomRefreshControl.h"
#import "NSString+HTML.h"
#import "RBPostDetailTableViewController.h"

@interface RBThirdViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableViewBlog;

@end

int currentPage;
NSDateFormatter *formatter1;
NSDateFormatter *formatter2;

@implementation RBThirdViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBThirdViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBThirdViewController"];
    
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.slidingViewController.topViewController.view addGestureRecognizer:self.slidingViewController.panGesture];
    //self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    currentPage = 1;
    [self.tableViewBlog registerNib:[UINib nibWithNibName:@"RBBlogCustomCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier: @"RBBlogCustomCell"];
    
    self.navigationItem.hidesBackButton = YES;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:(79/255.0) green:(193/255.0) blue:(233/255.0) alpha:1]];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
    UIRefreshControl *bottomRefreshControl = [UIRefreshControl new];
    [bottomRefreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
	self.tableViewBlog.bottomRefreshControl = bottomRefreshControl;
    [self setRefreshControl:bottomRefreshControl];
    _postArray = [[NSArray alloc] init];
    formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"dd MMM yy"];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refresh:self.refreshControl];
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"goToPostDetail"]) {
        RBPostDetailTableViewController *vc = (RBPostDetailTableViewController*)segue.destinationViewController;
        vc.postInfo = (NSDictionary*)sender;
    }
}
- (void)refresh:(id)sender {
    [self.refreshControl beginRefreshing];
    [[RBWebServices sharedWebService] getRecentPost:@{@"page": [NSNumber numberWithInt:currentPage]} success:^(NSArray *arrayPost) {
        _postArray = [_postArray arrayByAddingObjectsFromArray:arrayPost];
        [self.tableViewBlog reloadData];
        currentPage += 1;
        [(UIRefreshControl *)sender endRefreshing];
    } failure:^(NSString *error) {
        [[[UIAlertView alloc] initWithTitle:@"Failed" message:error delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
        [(UIRefreshControl *)sender endRefreshing];
    }];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_postArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

        return 80;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0){
        
        
        RBBlogCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RBBlogCustomCell"];
        
        NSDictionary *item = [_postArray objectAtIndex:indexPath.row];
        cell.labelHeader.text = [[item objectForKey:@"title"] stringByDecodingHTMLEntities];
        
        NSString *path = [item objectForKey:@"thumbnail"];
        NSURL *url = [NSURL URLWithString:path];
        [cell.imageViewArticle setImageWithURL:url];
        NSDate *date = [formatter1 dateFromString:[item objectForKey:@"date"]];
        cell.labelTime.text =[formatter2 stringFromDate:date];
        
        
        return cell;
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"goToPostDetail" sender:[_postArray objectAtIndex:indexPath.row]];
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
