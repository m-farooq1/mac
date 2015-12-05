//
//  Course.m
//  CDCourse -- Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "Course.h"


@implementation Course

@dynamic title;
@dynamic author;
@dynamic releaseDate;

-(void)awakeFromInsert{
    [super awakeFromInsert];
    self.releaseDate = [NSDate date];
}

@end
