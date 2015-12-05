//
//  ThirdViewController.m
//  TabbedExample -- multiple view controllers
//
//  Created by Muhammad Farooq on 03/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblThirdView;

@end

@implementation ThirdViewController

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
    self.lblThirdView.text = [NSString stringWithFormat:@"%@ Controller", self.lblThirdView.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
