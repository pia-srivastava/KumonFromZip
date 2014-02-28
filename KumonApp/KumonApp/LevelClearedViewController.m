//
//  LevelClearedViewController.m
//  KumonApp
//
//  Created by Pia Srivastava on 2/24/14.
//  Copyright (c) 2014 malena mesarina. All rights reserved.
//

#import "LevelClearedViewController.h"
#import "AssignmentsTableViewController.h"
@interface LevelClearedViewController ()
- (IBAction)onAssignmentsButton:(id)sender;
- (IBAction)onNextButton:(id)sender;

@end

@implementation LevelClearedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAssignmentsButton:(id)sender {
    
    //TODO Pia, put this in once the AssignmentsVC has been updated
//    assignmentsVC.studentUserName = self.NameText.text;
//    assignmentsVC.studentName = objects[0][@"FirstName"];
//    [self.navigationController pushViewController:assignmentsVC animated:YES];
    AssignmentsTableViewController *assignmentsVC = [[AssignmentsTableViewController alloc] init];
    [self presentViewController:assignmentsVC animated:YES completion:NULL];

    
}

- (IBAction)onNextButton:(id)sender {
    
    //find the assignment that is the next one in the list sequentially that is *not* done
    
}
@end
