//
//  CoursesTableViewController.h
//  CDCourses
//
//  Created by Simon Allardice on 9/9/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCourseViewController.h"

@interface CoursesTableViewController : UITableViewController
<AddCourseViewControllerDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
