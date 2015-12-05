//
//  Data.m
//  noteTaking -- Lynda
//
//  Created by Muhammad Farooq on 04/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "Data.h"

@implementation Data
static Note *currentNote;
static int currentNoteIndex;
static NSMutableArray *notes;
static Note *currentNote;
//@synthesize currentNote = _currentNote;
//@synthesize currentNoteIndex = _currentNoteIndex;

+(void) initialize{
    if(notes == nil){
        NSDictionary *notesDic = [[NSUserDefaults standardUserDefaults] dictionaryForKey:kALlNotes];
        NSDictionary *notesDicFile = [[NSDictionary alloc] initWithContentsOfFile:[Data filePath]];
        NSMutableArray* arr=[[NSMutableArray alloc] init];
        Note *note;
        for(id key in notesDic){
            note =[[Note alloc] init];
            note.text = notesDic[key];
            note.dateAdded = key;
            [arr addObject:note];
        }
        
        notes = [[NSMutableArray alloc] initWithArray:arr];
    }
}

+(NSMutableArray *)getAllNotes{
    return notes;
}

+(void)setCurrentNote{
    currentNote = (Note *)notes[currentNoteIndex];
}

+(void)setCurrentNoteForIndex:(int)index{
    if(index < 0 || index >= notes.count) {
        currentNoteIndex = -1;
        currentNote = nil;
        return;
    }
    currentNoteIndex = index;
    currentNote = (Note *) notes[currentNoteIndex];
}

+(Note *)getCurrentNote{
    return currentNote;
}

+(Note *)getNoteForIndex:(int)index{
    return notes[index];
}

+(int)getNoteCount{
    return notes.count;
}

+(Note *) removeNoteAtIndex:(int)index{
    Note *note = notes[index];
    [notes removeObjectAtIndex:index];
    return note;
}


+(void) addNote:(NSString *)text date:(NSDate *)date atIndex: (int) index{
    Note *note=[[Note alloc] init];
    note.text = text;
    note.dateAdded = date;
    [notes insertObject:note atIndex:index];
}

+(void)saveNotes{
    NSMutableDictionary *dicNotes = [[NSMutableDictionary alloc] init];
    for(Note *n in notes){
        dicNotes[[n.dateAdded description]] = n.text;
    }
    [[NSUserDefaults standardUserDefaults] setObject:dicNotes forKey:kALlNotes];
    [dicNotes writeToFile:[self filePath] atomically:YES];
}

+(NSString *)filePath{
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docs = [directories objectAtIndex:0];
    return [docs stringByAppendingString:kALlNotes];
}

@end



