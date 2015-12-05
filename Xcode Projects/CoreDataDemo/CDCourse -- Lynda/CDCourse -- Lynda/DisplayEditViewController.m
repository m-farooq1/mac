//
//  DisplayEditViewController.m
//  CDCourse -- Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "DisplayEditViewController.h"

@interface DisplayEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *releaseDateField;
@property (weak, nonatomic) IBOutlet UIDatePicker *releaseDatePicker;

@end

@implementation DisplayEditViewController

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
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.releaseDateField.text = [formatter stringFromDate:self.currentCourse.releaseDate];
 
    self.releaseDatePicker.date = self.currentCourse.releaseDate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)EditDone:(id)sender {
    UINavigationItem *editButton = (UINavigationItem *) sender;
    if([editButton.title isEqualToString:@"Edit"]){
        self.titleField.enabled = self.authorField.enabled = self.releaseDateField .enabled = YES;
        self.titleField.borderStyle = self.authorField.borderStyle = self.releaseDateField .borderStyle =UITextBorderStyleRoundedRect;
        
        editButton.title = @"Done";
    }
    else if([editButton.title isEqualToString:@"Done"]){
         self.titleField.enabled = self.authorField.enabled = self.releaseDateField .enabled = NO;
          self.titleField.borderStyle = self.authorField.borderStyle = self.releaseDateField .borderStyle =UITextBorderStyleNone;
        
        self.currentCourse.title = self.titleField.text;
        
        self.currentCourse.author = self.authorField.text;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        self.currentCourse.releaseDate  = [formatter dateFromString:self.releaseDateField.text];
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate saveContext];
         editButton.title = @"Edit";
    }
}

@end
