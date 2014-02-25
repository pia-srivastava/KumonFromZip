//
//  AssignmentsTableViewController.m
//  KumonApp
//
//  Created by malena mesarina on 2/21/14.
//  Copyright (c) 2014 malena mesarina. All rights reserved.
//

#import "AssignmentsTableViewController.h"
#import "MyCell.h"
#import <Parse/Parse.h>


@interface UINavigationBar (myNave)
- (CGSize)changeHeight:(CGSize)size;
@end

@implementation UINavigationBar (customNav)
- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = CGSizeMake(320,73);
    return newSize;
}
@end

@interface AssignmentsTableViewController ()

@property (strong, nonatomic) NSMutableDictionary *assignmentsNamesToImagesDic;
@property (nonatomic, strong) NSString *studentUserName;

@property (nonatomic, strong) NSMutableArray *AssignmentsArray;
@property (nonatomic, strong) NSMutableDictionary *CheckMarksDic;
- (void) GetAssignments;


- (void)levels_info_button: (UIButton*) sender;

- (void)levels_settings_button: (UIButton*) sender;

@end

@implementation AssignmentsTableViewController

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
	
	//For testing ....
	
	self.AssignmentsArray = [[NSMutableArray alloc] init];
	self.CheckMarksDic = [[NSMutableDictionary alloc] init];
	
	self.studentUserName = @"mmesarina";
	
	
	
	
	//MAKE THE NAVIGATIONBAR BACKGROUND
	
	self.navigationController.navigationBar.hidden = NO;
	//[self.navigationController.navigationBar setBackgroundImage:[@"levels_header.png" ] forBarMetrics:UIBarMetricsDefault]];
	//[self.navigationController.navigationBar setBackgroundImage:@"levels_header.png" forBarMetrics:UIBarMetricsDefault];
	
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"levels_header.png"]
												  forBarMetrics:UIBarMetricsDefault];
	
	// SET TITLE IMAGE
	
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"levels_title.png"]];
	
	// Set BODY background image
	UIImageView *boxBackView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"levels_background.png"]];
	[self.tableView setBackgroundView:boxBackView];
	
	//Set INFO BUTTON
	
	UIImage *info_butt_image = [UIImage imageNamed:@"levels_info.png"];
	CGRect frameimg = CGRectMake(0, 0, info_butt_image.size.width, info_butt_image.size.height);
	UIButton *infoButton = [[UIButton alloc] initWithFrame:frameimg];
	[infoButton setBackgroundImage:info_butt_image forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(levels_info_button:)
		 forControlEvents:UIControlEventTouchUpInside];
	[infoButton setShowsTouchWhenHighlighted:YES];
	
	UIBarButtonItem *infoButtonItem =[[UIBarButtonItem alloc] initWithCustomView:infoButton];
	self.navigationItem.rightBarButtonItem=infoButtonItem;
	
	// Set SETTINGS BUTTON
	
	UIImage *settings_butt_image = [UIImage imageNamed:@"levels_settings.png"];
	frameimg = CGRectMake(0, 0, settings_butt_image.size.width, settings_butt_image.size.height);
	UIButton *settingsButton = [[UIButton alloc] initWithFrame:frameimg];
	[settingsButton setBackgroundImage:settings_butt_image forState:UIControlStateNormal];
	[settingsButton addTarget:self action:@selector(levels_settings_button:)
			 forControlEvents:UIControlEventTouchUpInside];
	[settingsButton setShowsTouchWhenHighlighted:YES];
	
	UIBarButtonItem *settingsButtonItem =[[UIBarButtonItem alloc] initWithCustomView:settingsButton];
	self.navigationItem.leftBarButtonItem =settingsButtonItem;
	
	
	
	
	// Register AssignmentCell
	
	UINib *myCellNib = [UINib nibWithNibName:@"MyCell" bundle:nil];
    [self.tableView registerNib:myCellNib forCellReuseIdentifier:@"MyCell"];
	
	
	
	// Load the Assignments dictionary mapping assignment key to assignment PNG name
	self.assignmentsNamesToImagesDic = (NSMutableDictionary*) @{@"B46":@"levels_b46.png", @"B47":@"levels_b47.png", @"B48":@"levels_b48.png", @"B49":@"levels_b49.png"};
	
	// Later .... read the assignments from Parse assigned to this student.
	[self GetAssignments];
	
	
	
	//[self.tableView reloadData];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
    // Return the number of sections.
	
	
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
	// Replace later with actual count of assignments assigned to student
	// NSInteger count = [self.testArray count];
	//return count;
	
	NSLog(@"NumberOfRowsInSection %d", self.AssignmentsArray.count);
	
	return self.AssignmentsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	NSLog(@"In cellForRow");
	static NSString *CellIdentifier = @"MyCell";
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	
	// See if CheckMark should be displayed
	
	NSString *assignment = self.AssignmentsArray[indexPath.row];
	
	
	NSString *doneStatus = self.CheckMarksDic[assignment];
	UIImage *checkmarkImage = [UIImage imageNamed:@"levels_checkmark.png"];
	UIImageView *checkmarkView = (UIImageView*)[cell viewWithTag:2];
	
	if ( [doneStatus isEqualToString:@"YES"]) {
		checkmarkView.hidden = NO;
		checkmarkView.image = checkmarkImage;
		
	} else {
		checkmarkView.hidden = YES;
	}
	
	
	
	NSLog(@"assignment name = %@", assignment);
	NSString *imageName = self.assignmentsNamesToImagesDic[assignment];
	NSLog(@"imageName = %@", imageName);
	
	UIImage* image = [UIImage imageNamed:imageName];
	UIImageView *asgmView = (UIImageView*)[cell viewWithTag:1];
	
	asgmView.image = image;
	
	
	
	
	cell.backgroundColor = [UIColor clearColor];
	
	
	
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat width = screenRect.size.width;
    width -= 64;
	
	//GET SIZE OF RETWEET USERNAME
	
	UIImage *sampleImage = [UIImage imageNamed:@"levels_b46"];
	CGFloat h = sampleImage.size.height;
	
	NSLog(@"height = %f", h);
	
	//UIImageView *asmgtImageView = [[UIImageView alloc] init];
	//asmgtImageView.frame =CGRectMake(0,0,240,107);
	
	//CGFloat h = asmgtImageView.frame.size.height;
	
	h = sampleImage.size.height + 10 + 10;
	
	
	
    return h;
	
	
}




//- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {


//}



- (void) GetAssignments {
	
	NSLog(@"In Get Assignments");
	
	// Get the name of the assignments
	
	PFQuery *query = [PFQuery queryWithClassName:@"AssignmentsToUsers"];
	[query whereKey:@"UserName" equalTo:@"mmesarina"];
	[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
		if (!error) {
			// The find succeeded.
			NSLog(@"Successfully retrieved %d objects.", objects.count);
			// Do something with the found objects
			
			for (PFObject *object in objects) {
				
				[self.AssignmentsArray addObject:object[@"Assignment"]];
				
				
				[self.CheckMarksDic setValue:object[@"Done"] forKey:object[@"Assignment"]];
				
				
				//NSLog(@"Size of self.AssignmentsArray is %d" ,self.AssignmentsArray.count);
				
				//NSLog(@"CheckMarksDic Key:%@ Value: %@", object[@"Assignment"],object[@"Done"]);
				
				
				
			}
			
			
			NSLog(@"Size of self.AssignmentsArray is %d", self.AssignmentsArray.count);
		    for (id as in self.AssignmentsArray) {
				NSLog(@"assignment retrieved was %@", as);
			}
			
			
			[self.tableView reloadData];
			
		} else {
			// Log details of the failure
			NSLog(@"Error: %@ %@", error, [error userInfo]);
		}
	}];
	
	
	
	
}



#pragma - private methods

- (void)levels_info_button: (UIButton*) sender {
	
	NSLog(@"Pressed levels_info_button");
}


- (void)levels_settings_button: (UIButton*) sender {
	
	NSLog(@"Pressed levels_settings_button");
}

@end
