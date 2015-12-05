//
//  InfoViewController.h
//  PhotViewer -- StoryBoard
//
//  Created by Muhammad Farooq on 03/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface InfoViewController : UIViewController

@property (nonatomic) Photo *currentPhoto;
-(void)setCPhoto:(Photo *) currentPhoto;
@end