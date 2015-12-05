//
//  MainViewController.h
//  iPadUtility -- iPad Development
//
//  Created by Muhammad Farooq on 04/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
