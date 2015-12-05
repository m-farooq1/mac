//
//  ViewController.m
//  TableDemo -- Table Views
//
//  Created by Muhammad Farooq on 02/08/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSDictionary *CourseDetails;
    NSArray *courseNames;

    NSDictionary *webCourseDetails;
    NSArray *webCourseNames;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *sectionTitle = @"";
    switch (section) {
        case 0:
            sectionTitle = @"iOS Courses";
            break;
        case 1:
            sectionTitle = @"Web Courses";
            break;
        default:
            break;
    }
    return sectionTitle;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int numberOfRows = 0;
    switch (section) {
        case 0:
            numberOfRows =[CourseDetails count];
            break;
        case 1:
            numberOfRows = [webCourseDetails count];
            break;
        default:
            break;
    }
    return numberOfRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   /* UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];*/
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //UIImage *image=[UIImage imageNamed:@"DemoCellImage"];
    //[cell.imageView setImage:image];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = courseNames[indexPath.row];
            cell.detailTextLabel.text = CourseDetails[courseNames[indexPath.row]];
            break;
        case 1:
           cell.textLabel.text = webCourseNames[indexPath.row];
            cell.detailTextLabel.text = webCourseDetails[webCourseNames[indexPath.row]];
            break;
        default:
            break;
    }
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"courses" withExtension:@"plist"];
    NSURL *webUrl = [[NSBundle mainBundle] URLForResource:@"courses_web" withExtension:@"plist"];
    //load the plist into dictionary
    CourseDetails = [NSDictionary dictionaryWithContentsOfURL:url];
    courseNames = [CourseDetails allKeys];
    
    webCourseDetails = [NSDictionary dictionaryWithContentsOfURL:webUrl];
    webCourseNames = [webCourseDetails allKeys];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
