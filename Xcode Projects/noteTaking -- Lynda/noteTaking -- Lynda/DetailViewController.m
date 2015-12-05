//
//  DetailViewController.m
//  noteTaking -- Lynda
//
//  Created by Muhammad Farooq on 04/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtNote;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.txtNote.text = [self.detailItem text];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self.navigationItem.backBarButtonItem setAction:@selector(perform:)];
    [self.txtNote becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    NSString *text=[self.txtNote.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    
    if([text length] >0)
        [self.delegate insertNewNote:self.txtNote.text date:[[NSDate alloc] init] currentNote:self.detailItem];
}

-(void) perform:(id)sender {
    //do your saving and such here
   /*  [self.delegate insertNewNote:self.txtNote.text date:[[NSDate alloc] init]];
    [self.navigationController popViewControllerAnimated:YES];*/
}

@end
