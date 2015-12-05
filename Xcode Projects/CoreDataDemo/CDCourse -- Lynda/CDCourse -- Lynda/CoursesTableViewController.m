//
//  CoursesTableViewController.m
//  CDCourse -- Lynda
//
//  Created by Muhammad Farooq on 09/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "CoursesTableViewController.h"

@interface CoursesTableViewController ()

@end

@implementation CoursesTableViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSError *error;
    if(![self.fetchedResultsController performFetch:&error]){
        NSLog(@"Error! %@", error);
       // abort();
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark Fetched Results controller Section
-(NSFetchedResultsController *) fetchedResultsController{
    if(_fetchedResultsController!=nil)
        return _fetchedResultsController;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Course"
                                              inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"author"
                                                                   ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];

    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"author" cacheName:nil];
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView endUpdates];
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:{
            Course *changedCourse = (Course *)[self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = changedCourse.title;
        }
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];

            break;
        default:
            break;
    }
}

-(void) controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
        default:
            break;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> secInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [secInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Course *course = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = course.title;
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    id <NSFetchedResultsSectionInfo> secInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [secInfo name];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:sourceIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:destinationIndexPath] withRowAnimation:UITableViewRowAnimationFade];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Course *courseToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.managedObjectContext deleteObject:courseToDelete];
        
        NSError *error = nil;
        if(![self.managedObjectContext save:&error]){
            NSLog(@"Error! %@", error);
        }
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"newCourse"]){
        NewCourseController *newCVC = (NewCourseController *)[segue destinationViewController];
        newCVC.delegate = self;
        Course *newCourse = (Course *)[NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:self.managedObjectContext];
        newCVC.currentCourse = newCourse;
    }
    else if([[segue identifier] isEqualToString:@"displayEditCourse"]){
        DisplayEditViewController *dispECVC = (DisplayEditViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Course *newCourse = (Course *)[self.fetchedResultsController objectAtIndexPath:indexPath];
        dispECVC.currentCourse = newCourse;
    }
}

-(void)newCourseViewControllerDidSave{
    NSError *error;
     if(![[self managedObjectContext] save:&error]){
     NSLog(@"Error! %@", error);
          }
    [self dismissModalViewControllerAnimated:YES];

}
-(void)newCourseViewControllerDidCancel:(Course *)courseToDelete{
    [self.managedObjectContext deleteObject:courseToDelete];
    [self dismissModalViewControllerAnimated:YES];
}
@end
