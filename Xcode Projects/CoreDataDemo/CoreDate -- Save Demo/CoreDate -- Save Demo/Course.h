//
//  Course.h
//  CoreDate -- Save Demo
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) NSString * author;

-(void) simpleMethod;
@end
