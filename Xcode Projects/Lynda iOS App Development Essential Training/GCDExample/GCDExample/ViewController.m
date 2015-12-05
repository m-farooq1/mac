//
//  ViewController.m
//  GCDExample
//
//  Created by Muhammad Farooq on 03/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    dispatch_queue_t myQueue;
}
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end

@implementation ViewController
- (IBAction)longRunningStart:(id)sender {
    if(!myQueue)
        myQueue = dispatch_queue_create("com.example.GCDExample.gcdTest", NULL);
    dispatch_async(myQueue, ^{
        [self longRunningOperation];
    });
}

-(void) longRunningOperation{
    [NSThread sleepForTimeInterval:5];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.lblResult setText:[NSString stringWithFormat:@"Result: %d",arc4random()]];
    });
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
