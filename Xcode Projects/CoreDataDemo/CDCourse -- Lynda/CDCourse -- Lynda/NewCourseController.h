//
//  NewCourseController.h
//  CDCourse -- Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@protocol NewCourseViewControllerDelegate;

@interface NewCourseController : UIViewController
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
@property (nonatomic) id <NewCourseViewControllerDelegate> delegate;
@property (nonatomic) Course *currentCourse;
@end

@protocol NewCourseViewControllerDelegate

-(void) newCourseViewControllerDidSave;
-(void) newCourseViewControllerDidCancel:(Course *) courseToDelete;


@end