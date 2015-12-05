//
//  AppDelegate.h
//  CoreDate -- Save Demo
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Course.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;
- (IBAction)createObject:(id)sender;
- (IBAction)fetchObjects:(id)sender;

@end
