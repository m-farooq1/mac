//
//  InfoViewController.m
//  PhotViewer -- StoryBoard
//
//  Created by Muhammad Farooq on 03/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detialsLabel;

@end

@implementation InfoViewController
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setCPhoto:(Photo *) currentPhoto{
    self.currentPhoto = currentPhoto;
}

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
    self.detialsLabel.text = self.currentPhoto.notes;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
