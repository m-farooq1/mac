//
//  MasterViewController.h
//  noteTaking -- Lynda
//
//  Created by Muhammad Farooq on 04/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "DetailViewController.h"
#import "Data.h"

@interface MasterViewController : UITableViewController<DetailViewControllerDelegate>
@property (nonatomic) NSMutableArray *notes;
@end
