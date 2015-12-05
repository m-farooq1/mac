//
//  Author.h
//  CoreData -- Cocoa -- Desktop --Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Author : NSManagedObject

@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *courses;
@end

@interface Author (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(Course *)value;
- (void)removeCoursesObject:(Course *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

@end
