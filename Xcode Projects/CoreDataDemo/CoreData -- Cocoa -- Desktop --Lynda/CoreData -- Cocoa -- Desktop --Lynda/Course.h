//
//  Course.h
//  CoreData -- Cocoa -- Desktop --Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Author;

@interface Course : NSManagedObject

@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Author *author;

-(BOOL) validateReleaseDate:(id *)values error:(NSError **) error;
@end
