//
//  DetailViewController.h
//  MDExample -- multiple view controllers
//
//  Created by Muhammad Farooq on 03/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
