//
//  RBPostDetailTableViewController.m
//  Brightr
//
//  Created by Reza on 9/3/14.
//  Copyright (c) 2014 Reza. All rights reserved.
//

#import "RBPostDetailTableViewController.h"
#import "NSString+HTML.h"
#import "UIImageView+AFNetworking.h"

#define titleFont [UIFont systemFontOfSize:17]
#define authorFont [UIFont systemFontOfSize:16]
#define descriptionFont [UIFont systemFontOfSize:14]
#define nCommentFont [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]
#define usernameFont [UIFont systemFontOfSize:14]
#define commentFont [UIFont systemFontOfSize:14]
#define timeFont [UIFont systemFontOfSize:13]

@interface RBPostDetailTableViewController ()

@end

NSDateFormatter *formatter1;

@implementation RBPostDetailTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)prettyDate:(NSDate*)date
{
    NSString * prettyTimestamp;
    
    float delta = [date timeIntervalSinceNow] * -1;
    
    if (delta < 60) {
        prettyTimestamp = @"just now";
    } else if (delta < 120) {
        prettyTimestamp = @"one minute ago";
    } else if (delta < 3600) {
        prettyTimestamp = [NSString stringWithFormat:@"%d minutes ago", (int) floor(delta/60.0) ];
    } else if (delta < 7200) {
        prettyTimestamp = @"one hour ago";
    } else if (delta < 86400) {
        prettyTimestamp = [NSString stringWithFormat:@"%d hours ago", (int) floor(delta/3600.0) ];
    } else if (delta < ( 86400 * 2 ) ) {
        prettyTimestamp = @"one day ago";
    } else if (delta < ( 86400 * 7 ) ) {
        prettyTimestamp = [NSString stringWithFormat:@"%d days ago", (int) floor(delta/86400.0) ];
    } else {
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        
        prettyTimestamp = [NSString stringWithFormat:@"on %@", [formatter stringFromDate:date]];
    }
    
    return prettyTimestamp;
}

- (void)configureCell:(UITableViewCell *)cell indexPAth:(NSIndexPath*)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row != 2) {
            UIFont *font = titleFont;
            NSString *strText = [self.postInfo[@"title"] stringByDecodingHTMLEntities];
            if(indexPath.row == 1){
                font = authorFont;
                strText = self.postInfo[@"author"][@"name"];
            }
            else if(indexPath.row == 3){
                font = descriptionFont;
                strText = [self.postInfo[@"content"] stringByConvertingHTMLToPlainText];
            }
            else if(indexPath.row == 4){
                font = nCommentFont;
                strText = [NSString stringWithFormat:@"%d %@",[self.postInfo[@"comments"] count],[self.postInfo[@"comments"] count] > 1?@"COMMENTS":@"COMMENT"];
            }
            CGRect paragraphRect =
            [strText boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
            
            UILabel *label = (UILabel*)[cell viewWithTag:1];
            CGRect frame = label.frame;
            frame.size.height = paragraphRect.size.height;
            
            [label setFrame:frame];
            [label setText:strText];
            [label setFont:font];
            
        }
        else if(indexPath.row == 2){
            NSString *urlString = self.postInfo[@"thumbnail_images"][@"medium"][@"url"];
            UIImageView *imageView = (UIImageView*)[cell viewWithTag:1];
            [imageView setImageWithURL:[NSURL URLWithString:urlString]];
        }
    }
    else{
        int height = 12;
        NSDictionary *comment =[[self.postInfo objectForKey:@"comments"] objectAtIndex:indexPath.row];
        NSString *strText = comment[@"name"];
        CGRect paragraphRect =
        [strText boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:usernameFont} context:nil];
        UILabel *label = (UILabel*)[cell viewWithTag:1];
        CGRect frame = label.frame;
        frame.size.height = paragraphRect.size.height;
        
        [label setFrame:frame];
        [label setText:strText];
        height = frame.origin.y + frame.size.height + 4;
        strText = [comment[@"content"] stringByConvertingHTMLToPlainText];
        paragraphRect =
        [strText boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:commentFont} context:nil];
        label = (UILabel*)[cell viewWithTag:2];
        frame = label.frame;
        frame.origin.y = height;
        frame.size.height = paragraphRect.size.height;
        
        [label setFrame:frame];
        [label setText:strText];
        height = frame.origin.y + frame.size.height + 4;
        
        NSDate *date = [formatter1 dateFromString:comment[@"date"]];
        strText = [self prettyDate:date];
        paragraphRect =
        [strText boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:timeFont} context:nil];
        label = (UILabel*)[cell viewWithTag:3];
        frame = label.frame;
        frame.origin.y = height;
        frame.size.height = paragraphRect.size.height;
        
        [label setFrame:frame];
        [label setText:strText];
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 1) {
        [self.postInfo[@"comments"] count];
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int height = 0;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0 || indexPath.row == 3) {
            UIFont *font = titleFont;
            NSString *strText = [self.postInfo[@"title"] stringByDecodingHTMLEntities];
            if(indexPath.row == 3){
                font = descriptionFont;
                strText = [self.postInfo[@"content"] stringByConvertingHTMLToPlainText];
            }
            
            CGRect paragraphRect =
            [strText boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
            height = paragraphRect.size.height+25;
        }
        else if(indexPath.row == 1){
            height = 35;
        }
        else if(indexPath.row == 2){
            height = 180;
        }
        else if(indexPath.row == 4){
            height = 80;
        }
    }
    else{
        NSDictionary *comment =[[self.postInfo objectForKey:@"comments"] objectAtIndex:indexPath.row];
        NSString *strText = comment[@"name"];
        CGRect paragraphRect =
        [strText boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:usernameFont} context:nil];
        height = paragraphRect.size.height+height;
        
        strText = [comment[@"content"] stringByConvertingHTMLToPlainText];
        paragraphRect =
        [strText boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:commentFont} context:nil];
        height = paragraphRect.size.height+height;
        
        NSDate *date = [formatter1 dateFromString:comment[@"date"]];
        strText = [self prettyDate:date];
        paragraphRect =
        [strText boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:timeFont} context:nil];
        height = paragraphRect.size.height+height+25;
        
    }
    
    return height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"comment";
    if (indexPath.section == 0) {
        cellIdentifier = [NSString stringWithFormat:@"header%d",indexPath.row+1];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [self configureCell:cell indexPAth:indexPath];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
