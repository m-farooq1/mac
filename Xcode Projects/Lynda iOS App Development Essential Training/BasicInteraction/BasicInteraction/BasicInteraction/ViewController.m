//
//  ViewController.m
//  BasicInteraction
//
//  Created by Muhammad Farooq on 02/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
- (IBAction)buttonClicked:(id)sender {
    [[self lblField] setText:[NSString stringWithFormat:@"Welcome %@",[[self txtField] text]]];
    //[[self txtField] endEditing:YES];
    [[self txtField] resignFirstResponder];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.txtField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
