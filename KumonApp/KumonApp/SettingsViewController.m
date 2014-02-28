//
//  SettingsViewController.m
//
//
//  Created by Pia Srivastava on 2/27/14.
//
//

#import "SettingsViewController.h"
#import "AssignmentsTableViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *soundOnButton;
@property (weak, nonatomic) IBOutlet UIButton *soundOffButton;
- (IBAction)onBackButton:(id)sender;
- (IBAction)onSoundOnButton:(id)sender;
- (IBAction)onSoundsOffButton:(id)sender;

@end

@implementation SettingsViewController

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
    
    //Set inital settings accordingly
    NSString *sound = [[NSUserDefaults standardUserDefaults] objectForKey:@"sound"];
    NSLog(@"sound coming in is [%@]", sound);
    if([sound isEqualToString:@"on"]){
        [self.soundOnButton setImage:[UIImage imageNamed:@"settings_sound_on.png"] forState:UIControlStateNormal];
        [self.soundOffButton setImage:[UIImage imageNamed:@"settings_sound_off_dim.png"] forState:UIControlStateNormal];
    }
    else{
        [self.soundOffButton setImage:[UIImage imageNamed:@"settings_sound_off.png"] forState:UIControlStateNormal];
        [self.soundOnButton setImage:[UIImage imageNamed:@"settings_sound_on_dim.png"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBackButton:(id)sender {
    NSLog(@"onBackButton");
    
    //TODO make this work with nav controller! Pia
    //    assignmentsVC.studentUserName = self.NameText.text;
    //    assignmentsVC.studentName = objects[0][@"FirstName"];
    //    [self.navigationController pushViewController:assignmentsVC animated:YES];
    
    
    AssignmentsTableViewController *assignmentsVC = [[AssignmentsTableViewController alloc] init];
    [self presentViewController:assignmentsVC animated:YES completion:NULL];
    //    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)onSoundOnButton:(id)sender {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:@"on" forKey:@"sound"];
    [standardUserDefaults synchronize];
    
    [self.soundOnButton setImage:[UIImage imageNamed:@"settings_sound_on.png"] forState:UIControlStateNormal];
    [self.soundOffButton setImage:[UIImage imageNamed:@"settings_sound_off_dim.png"] forState:UIControlStateNormal];
}

- (IBAction)onSoundsOffButton:(id)sender {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:@"off" forKey:@"sound"];
    [standardUserDefaults synchronize];
    
    [self.soundOffButton setImage:[UIImage imageNamed:@"settings_sound_off.png"] forState:UIControlStateNormal];
    [self.soundOnButton setImage:[UIImage imageNamed:@"settings_sound_on_dim.png"] forState:UIControlStateNormal];
}
@end
