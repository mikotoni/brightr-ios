//
//  RBThirdViewController.h
//  bioRhythm
//
//  Created by defindal irvan on 8/5/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBThirdViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollerBlog;

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard;

@property (strong,nonatomic)NSArray *keys;
@property (strong,nonatomic)NSArray *postArray;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end
