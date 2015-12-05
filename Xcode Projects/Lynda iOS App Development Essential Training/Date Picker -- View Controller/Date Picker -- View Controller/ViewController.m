//
//  ViewController.m
//  Date Picker -- View Controller
//
//  Created by Muhammad Farooq on 02/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController
- (IBAction)displayDay:(id)sender {
    NSDate *date = [self.datePicker date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE"];
    NSString *weekDay = [formatter stringFromDate:date];
    NSString *msg = [NSString stringWithFormat:@"Thats a %@", weekDay];
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Picked Date" message:msg delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil,  nil];
    [alert show];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
