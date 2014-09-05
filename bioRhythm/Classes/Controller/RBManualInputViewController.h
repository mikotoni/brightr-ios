//
//  RBManualInputViewController.h
//  Brightr
//
//  Created by Tjaraka Asset on 8/28/14.
//  Copyright (c) 2014 Tjaraka Asset. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBManualInputViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard;

@property (nonatomic, retain) IBOutlet UIPickerView* sleepDurationPicker;

@end
