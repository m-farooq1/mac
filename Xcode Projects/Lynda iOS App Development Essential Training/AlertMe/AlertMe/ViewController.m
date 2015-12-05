//
//  ViewController.m
//  AlertMe
//
//  Created by Muhammad Farooq on 02/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Immediate alert" message:@"Here's your immediate alert message. It should appear when the app launches." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)viewDidAppear:(BOOL)animated{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Immediate alert" message:@"Here's your immediate alert message. It should appear when the app launches." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
