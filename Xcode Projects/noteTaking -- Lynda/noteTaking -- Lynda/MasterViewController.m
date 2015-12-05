//
//  MasterViewController.m
//  noteTaking -- Lynda
//
//  Created by Muhammad Farooq on 04/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController ()
@property  Note *selectedtNote;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [Data getAllNotes];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    //self.selectedtNote = nil;
    [Data setCurrentNoteForIndex:-1];
    [self performSegueWithIdentifier:@"showDetail" sender:sender];
   
    /* [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];*/
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // return self.notes.count;
    return [Data getNoteCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //Note *note = (Note *)self.notes[indexPath.row];
    Note *note = (Note *)[Data getNoteForIndex:indexPath.row];
    cell.textLabel.text = [note text];
    cell.detailTextLabel.text = [note.dateAdded description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       // [self.notes removeObjectAtIndex:indexPath.row];
        [Data removeNoteAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [Data setCurrentNoteForIndex:indexPath.row];
    return indexPath;
}

-(void)insertNewNote:(NSString *) text date:(NSDate *) date currentNote:(Note *) currentNote{
   /* if (!self.notes) {
        self.notes = [[NSMutableArray alloc] init];
    }
    if(!currentNote){
        Note *note = [[Note alloc] init];
        note.text = text;
        //note.text = [text substringWithRange:NSRangeFromString(@"0,2")];
        //note.text = @"test note";
        note.dateAdded =date;
        [self.notes insertObject:note atIndex:0];
        [self.tableView reloadData];
    }
    else{
        currentNote.text = text;
        [self.tableView reloadData];
    }
    self.selectedtNote = nil;*/
    if(![Data getCurrentNote]){
        [Data addNote:text date:date atIndex:0];
    }
    else{
        [Data getCurrentNote].text = text;
    }
    [self.tableView reloadData];
        
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        [[segue destinationViewController] setDetailItem:[Data getCurrentNote]];
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
