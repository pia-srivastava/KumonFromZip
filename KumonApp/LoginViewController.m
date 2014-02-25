//
//  LoginViewController.m
//
//
//  Created by Pia Srivastava on 2/16/14.
//
//

#import "LoginViewController.h"
#import "AssignmentsTableViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (nonatomic, strong) UITextField *NameText;
@property (nonatomic, strong) UITextField *PasswordText;

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

/*
 - (IBAction)onLoginButton:(id)sender {
 
 NSLog(@"onLoginButton") ;
 PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
 testObject[@"foo"] = @"bar";
 [testObject saveInBackground];
 //Go to Parse
 }
 */


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



//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
//	
//	if (textField.tag == 1) {
//		self.NameText = (UITextField*)[self.view viewWithTag:1];
//		
//	}
//	
//	// Check if userName and password is in the Parser DB
//	if (textField.tag == 2) { // if password was entered
//		self.PasswordText = (UITextField*) [self.view viewWithTag:2];
//		PFQuery *query = [PFQuery queryWithClassName:@"Student"];
//		[query whereKey:@"Username" equalTo:self.NameText.text];
//		[query whereKey:@"Password" equalTo:self.PasswordText.text];
//		[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//			if (!error) {
//				//Success in finding user
//				NSLog(@"User was found. OBject count = %d", objects.count);
//			} else {
//				// Ned to think abou
//				NSLog(@"Username is not in DB");
//				
//			}
//		}];
//	}
//	
//	
//	return YES;
//}

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
    
    //For debugging--gets back all the data within a class name
    //    PFQuery *query = [PFQuery queryWithClassName:@"Student"];
    //    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    //        if (!error) {
    //            NSLog(@"Objects: [%@]", objects);
    //            for (NSString *object in objects) {
    //                //[array valueForKey:specifyingKey]
    //                NSLog(@"username is [%@]",[objects valueForKey:@"UserName"]);
    //                NSLog(@"password is [%@]",[objects valueForKey:@"Password"]);
    //            }
    //            // The find succeeded. The first 100 objects are available in objects
    //        } else {
    //            // Log details of the failure
    //            NSLog(@"Error: %@ %@", error, [error userInfo]);
    //        }
    //    }];
    
    
    //	NSLog(@"self.NameText.text is %@", self.NameText.text);
    //   	NSLog(@"self.PasswordText.text is %@", self.PasswordText.text);
    //
    //	// Check if userName and password is in the Parser DB
    //	if (textField.tag == 2) { // if password was entered
    //		self.PasswordText = (UITextField*) [self.view viewWithTag:2];
    //		PFQuery *query = [PFQuery queryWithClassName:@"Student"];
    //		[query whereKey:@"UserName" equalTo:self.NameText.text];
    //		[query whereKey:@"Password" equalTo:self.PasswordText.text];
    //		[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    //			if (!error && objects && objects.count == 1) {
    //				//Success in finding user
    //                NSLog(@"ObjectsAgain: [%@]", objects);
    //				NSLog(@"User was found. OBject count = %d", objects.count);
    //			} else {
    //				// Ned to think about what to do if invalid username/password
    //				NSLog(@"Username is not in DB");
    //
    //
    //			}
    //		}];
    //	}
    //
	
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
                //                [self performSegueWithIdentifier:@"showAssignmentsTableSegue"];
                AssignmentsTableViewController *assignmentsVC = [[AssignmentsTableViewController alloc] init];
                [self presentViewController:assignmentsVC animated:YES completion:NULL];
            } else {
                // Need to think about what to do if invalid username/password
                NSLog(@"Username is not in DB");
                
                
            }
        }];
        
    }
    else{
        NSLog(@"Invalid name/password!");
    }
	
}

//- (IBAction)loginButtonAction:(UIButton *)sender {
//	
//	NSLog(@"In loginButtonAction");
//	AssignmentsTableViewController *assignmentsTableViewController = [[AssignmentsTableViewController alloc]initWithNibName:@"AssignmentsTableViewController" bundle:nil];
//	
//	[self.navigationController pushViewController:assignmentsTableViewController animated:YES];
//	
//	
//
//}
@end
