//
//  DetailViewController.h
//  noteTaking -- Lynda
//
//  Created by Muhammad Farooq on 04/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
@class DetailViewController;

@protocol DetailViewControllerDelegate
@required
-(void)insertNewNote:(NSString *) text date:(NSDate *) date currentNote:(Note *) note;
@end

@interface DetailViewController : UIViewController
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) id <DetailViewControllerDelegate> delegate;
@end

