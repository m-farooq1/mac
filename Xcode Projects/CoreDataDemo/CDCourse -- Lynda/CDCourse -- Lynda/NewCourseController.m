//
//  NewCourseController.m
//  CDCourse -- Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "NewCourseController.h"

@interface NewCourseController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *releaseDateField;
@property (weak, nonatomic) IBOutlet UIDatePicker *releaseDatePicker;

@end

@implementation NewCourseController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.titleField.text = self.currentCourse.title;
    self.authorField.text = self.currentCourse.author;
    NSDateFormatter *formatter=  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.releaseDatePicker.date = self.currentCourse.releaseDate;
    self.releaseDateField.text =[formatter stringFromDate:self.currentCourse.releaseDate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    self.currentCourse.title = self.titleField.text;
    self.currentCourse.author = self.authorField.text;
    NSDateFormatter *formatter=  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.currentCourse.releaseDate =[formatter dateFromString:self.releaseDateField.text];
 
    [self.delegate newCourseViewControllerDidSave];
}

- (IBAction)cancel:(id)sender {
    [self.delegate newCourseViewControllerDidCancel:self.currentCourse];
}
@end
