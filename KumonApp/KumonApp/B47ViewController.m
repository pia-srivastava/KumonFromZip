//
//  B47ViewController.m
//  KumonApp
//
//  Created by Pia Srivastava on 2/28/14.
//  Copyright (c) 2014 malena mesarina. All rights reserved.
//

#import "B47ViewController.h"
#import "AssignmentsTableViewController.h"
#import "LevelClearedViewController.h"

@interface B47ViewController()

- (IBAction)onBackButton:(id)sender;
- (IBAction)editingDidEndCheckSums:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UITextField *problem1;
@property (weak, nonatomic) IBOutlet UITextField *problem2;
@property (weak, nonatomic) IBOutlet UITextField *problem3;
@property (weak, nonatomic) IBOutlet UITextField *problem4;
@property (weak, nonatomic) IBOutlet UITextField *problem5;
@property (weak, nonatomic) IBOutlet UITextField *problem6;

@end

@implementation B47ViewController

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
    self.problem1.delegate = self;
    self.problem2.delegate = self;
    self.problem3.delegate = self;
    self.problem4.delegate = self;
    self.problem5.delegate = self;
    self.problem6.delegate = self;
    
    self.problem1.tag = 91;
    self.problem2.tag = 101;
    self.problem3.tag = 111;
    self.problem4.tag = 121;
    self.problem5.tag = 92;
    self.problem6.tag = 102;
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn: You entered %@",textField.text);
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onBackButton:(id)sender {
    NSLog(@"onBackButton");
    
    //TODO level cleared on back button?
    NSLog(@"self.problem1.rightView.tag is [%d]",self.problem1.rightView.tag);
    if(self.problem1.rightView.tag == 1){
        
        LevelClearedViewController *levelClearedVC = [[LevelClearedViewController alloc] init];
        [self presentViewController:levelClearedVC animated:YES completion:NULL];
    }
    
    
    //TODO make this work with nav controller! Pia
    //    assignmentsVC.studentUserName = self.NameText.text;
    //    assignmentsVC.studentName = objects[0][@"FirstName"];
    //    [self.navigationController pushViewController:assignmentsVC animated:YES];
    AssignmentsTableViewController *assignmentsVC = [[AssignmentsTableViewController alloc] init];
    [self presentViewController:assignmentsVC animated:YES completion:NULL];
}


- (IBAction)editingDidEndCheckSums:(UITextField *)sender{
    NSLog(@"editingDidEndCheckSums");
    
    [sender resignFirstResponder];
    int numberEntered = [sender.text intValue];
    NSLog(@"You entered %d",numberEntered);
    NSLog(@"Correct sum is %d",sender.tag);
    
    if(numberEntered == sender.tag){
        [sender setRightViewMode:UITextFieldViewModeAlways];
        sender.rightView.tag = 1;
        NSLog(@"self.problem1.rightView.tag is [%d]",self.problem1.rightView.tag);
        sender.rightView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"b47_correct_mark.png"]];
    }
    else{
        [sender setRightViewMode:UITextFieldViewModeAlways];
        sender.rightView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"b49_wrong_mark.png"]];
    }
}

@end
