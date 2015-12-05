//
//  DetailViewController.h
//  MDDemo -- iPad Controls
//
//  Created by Muhammad Farooq on 04/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
