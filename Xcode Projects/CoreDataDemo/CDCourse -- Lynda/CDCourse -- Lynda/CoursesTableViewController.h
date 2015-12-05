//
//  CoursesTableViewController.h
//  CDCourse -- Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "NewCourseController.h"
#import "DisplayEditViewController.h"

@interface CoursesTableViewController : UITableViewController <NewCourseViewControllerDelegate, NSFetchedResultsControllerDelegate>
@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
