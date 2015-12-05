//
//  ViewController.m
//  PickerDemo
//
//  Created by Muhammad Farooq on 02/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray *moods;

@end

@implementation ViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    UIColor *moodColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    [self.view setBackgroundColor:moodColor];
    return [self.moods count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.moods[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)componen{
    UIColor *moodColor;
    switch(row)
    {
        case 0: case 2:
            moodColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
            break;
        case 1:
            moodColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
            break;
    }
    [self.view setBackgroundColor:moodColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.moods = @[@"Happy", @"Sad", @"Relaxed"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
