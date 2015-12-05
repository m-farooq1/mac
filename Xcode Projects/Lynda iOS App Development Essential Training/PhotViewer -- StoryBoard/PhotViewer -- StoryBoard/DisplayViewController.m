//
//  DisplayViewController.m
//  PhotViewer -- StoryBoard
//
//  Created by Muhammad Farooq on 03/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@end

@implementation DisplayViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self performSegueWithIdentifier:@"showDetailsViewer" sender:self];
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
    [self.currentImage setImage:[UIImage imageNamed:self.currentPhoto.fileName]];
    self.title = self.currentPhoto.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqual: @"showDetailsViewer"]){
        InfoViewController *infoVC = (InfoViewController *)[segue destinationViewController];
        [infoVC setCPhoto:self.currentPhoto];
    }
}

@end
