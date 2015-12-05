//
//  Course.m
//  CoreData -- Cocoa -- Desktop --Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "Course.h"
#import "Author.h"


@implementation Course

@dynamic releaseDate;
@dynamic title;
@dynamic author;

-(BOOL)validateReleaseDate:(__autoreleasing id *)value error:(NSError *__autoreleasing *)error{
    if(*value==nil) return YES;
    
    NSDate *dateToValidate = *value;
    if([dateToValidate timeIntervalSinceDate:[NSDate date]] > (30 * 24 * 60 * 60)){
        
        NSString *errorString = @"Date cannot be more than 30 days in the futue";
        NSDictionary *errorDict = [NSDictionary dictionaryWithObject:errorString forKey:NSLocalizedDescriptionKey];
        NSError *err = [[NSError alloc] initWithDomain:@"DrillDown" code:100 userInfo:errorDict];
        *error = err;
        return NO;
    }
    
    return YES;
}

@end
