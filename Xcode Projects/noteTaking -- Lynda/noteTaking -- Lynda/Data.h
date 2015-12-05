//
//  Data.h
//  noteTaking -- Lynda
//
//  Created by Muhammad Farooq on 04/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

#define kALlNotes @"notes"

@interface Data : NSObject
+(NSMutableArray *) getAllNotes;
+(void) setCurrentNoteForIndex: (int) index;
+(Note *)removeNoteAtIndex:(int) index;
+(void) addNote:(NSString *)text date:(NSDate *)date atIndex:(int) index;
+(void) saveNotes;
+(NSString *)filePath;
+(void)setCurrentNoteForIndex:(int)index;
+(void)setCurrentNote;
+(Note *)getCurrentNote;
+(Note *)getNoteForIndex:(int)index;
+(int) getNoteCount;
+(void) initialize;
@end
