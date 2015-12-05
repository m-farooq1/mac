//
//  ViewController.h
//  Interface - view controllers
//
//  Created by Muhammad Farooq on 02/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *txtMain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *txtMainHeightContraint;


@end
