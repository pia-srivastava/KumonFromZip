//
//  LoginViewController.m
//
//
//  Created by Pia Srivastava on 2/16/14.
//
//

#import "LoginViewController.h"
#import "AssignmentsTableViewController.h"
#import "B49ViewController.h"
#import <Parse/Parse.h>
#import "LevelClearedViewController.h"
#import "SettingsViewController.h"

@interface LoginViewController ()
@property (nonatomic, strong) UITextField *NameText;
@property (nonatomic, strong) UITextField *PasswordText;
@property (weak, nonatomic) IBOutlet UIImageView *nameArea;
@property (weak, nonatomic) IBOutlet UIImageView *passwordArea;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)onB49Button:(id)sender;
- (IBAction)onLevelClearedButton:(id)sender;
- (IBAction)onSettingsButton:(id)sender;

@end

@implementation LoginViewController

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
	
	self.navigationController.navigationBar.hidden = YES;
	
	[self.nameTextField setBackgroundColor:[UIColor clearColor]];
	self.nameTextField.borderStyle = UITextBorderStyleNone;
	self.nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
	self.nameTextField.clearsOnBeginEditing = YES;
	self.nameTextField.tag = 1;
	self.nameTextField.delegate = self;
	
	[self.passwordTextField setBackgroundColor:[UIColor clearColor]];
	self.passwordTextField.borderStyle = UITextBorderStyleNone;
	self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
	self.passwordTextField.clearsOnBeginEditing = YES;
	self.passwordTextField.tag = 2;
	self.passwordTextField.delegate = self;
	
	/*[self.loginButton addTarget:self action:@selector(loginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];*/
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma - TextField Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	return;
}


// Method is called when Textfield has been asked to reisgn first responder status.
// This happens when user changes editing focus to another control.
// You can use this method to prompt user that text entered was invalid via an overlay view
// and ask to correct text
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	
	if (textField.tag == 1) {
		self.NameText = (UITextField*)[self.view viewWithTag:1];
		
	}
    if (textField.tag == 2) {
        self.PasswordText = (UITextField*) [self.view viewWithTag:2];
    }
    
	return YES;
}




// Method is called when Textfield has resigned first responder status.
// You would use this methods if you need your delegate to hide overaly views
// that should only appeared while editing text.
- (void)textFieldDidEndEditing:(UITextField *)textField {
	[textField resignFirstResponder];
	return;
}

// Method is called when the the built-in clear button is pressed inside TextField
// This button is enabled via property "clearButtonMode"
// This method is also called when editing begins and the clearsOnBeginEditing property of the text field is set to YES.
- (BOOL)textFieldShouldClear:(UITextField *)textField {
	
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}


#pragma - Button function

- (IBAction)onLoginButton:(id)sender {
    
    NSLog(@"onLoginButton!!!") ;
    NSString *nameEntered = self.NameText.text;
    NSString *passwordEntered = self.PasswordText.text;
    
    NSLog(@"self.NameText.text is %@", nameEntered);
   	NSLog(@"self.PasswordText.text is %@", passwordEntered);
    
	// Check if userName and password is in the Parser DB
    if(nameEntered !=nil && passwordEntered !=nil){
        PFQuery *query = [PFQuery queryWithClassName:@"Student"];
        [query whereKey:@"UserName" equalTo:self.NameText.text];
        [query whereKey:@"Password" equalTo:self.PasswordText.text];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error && objects && objects.count == 1) {
                //Success in finding user
                NSLog(@"ObjectsAgain: [%@]", objects);
                NSLog(@"User was found. OBject count = %d", objects.count);
                
                AssignmentsTableViewController *assignmentsVC = [[AssignmentsTableViewController alloc] init];
                assignmentsVC.studentUserName = self.NameText.text;
                assignmentsVC.studentName = objects[0][@"FirstName"];
                [self.navigationController pushViewController:assignmentsVC animated:YES];
            } else {
                //TODO Need to think about what to do if invalid username/password
                NSLog(@"Username is not in DB");
                
                
            }
        }];
        
    }
    else{
        NSLog(@"Invalid name/password!");
    }
	
}

- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)deregisterFromKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self registerForKeyboardNotifications];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self deregisterFromKeyboardNotifications];
    
    [super viewWillDisappear:animated];
    
}

- (void)keyboardWasShown:(NSNotification *)notification {
    
    NSDictionary* info = [notification userInfo];
    
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGPoint buttonOrigin = self.passwordArea.frame.origin;
    
    CGFloat buttonHeight = self.passwordArea.frame.size.height;
    
    CGRect visibleRect = self.view.frame;
    
    visibleRect.size.height -= keyboardSize.height;
    
    if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
        
        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    
}

- (IBAction)onB49Button:(id)sender {
    B49ViewController *b49VC = [[B49ViewController alloc] init];
    [self presentViewController:b49VC animated:YES completion:NULL];
}

- (IBAction)onLevelClearedButton:(id)sender {
    LevelClearedViewController *levelClearedVC = [[LevelClearedViewController alloc] init];
    [self presentViewController:levelClearedVC animated:YES completion:NULL];
    
}

- (IBAction)onSettingsButton:(id)sender {
    SettingsViewController *settingsClearedVC = [[SettingsViewController alloc] init];
    [self presentViewController:settingsClearedVC animated:YES completion:NULL];
    
}
@end
