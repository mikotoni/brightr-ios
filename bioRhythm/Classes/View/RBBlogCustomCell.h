//
//  RBBlogCustomCell.h
//  Brightr
//
//  Created by Tjaraka Asset on 8/29/14.
//  Copyright (c) 2014 Tjaraka Asset. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBBlogCustomCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *labelHeader;
@property (strong, nonatomic) IBOutlet UILabel *labelTime;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewArticle;

@end
