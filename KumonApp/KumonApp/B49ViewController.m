//
//  B49ViewController.m
//  KumonApp
//
//  Created by Pia Srivastava on 2/24/14.
//  Copyright (c) 2014 malena mesarina. All rights reserved.
//

#import "B49ViewController.h"
#import "AssignmentsTableViewController.h"

@interface B49ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightOrWrongImage;

- (IBAction)onBackButton:(id)sender;
- (IBAction)onTap30:(UITapGestureRecognizer *)sender;
- (IBAction)onTap40:(UITapGestureRecognizer *)sender;

@end

@implementation B49ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (AVAudioPlayer *)loadWav:(NSString *)filename {
    NSURL * url = [[NSBundle mainBundle] URLForResource:filename withExtension:@"m4a"];
    NSError * error;
    AVAudioPlayer * player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) {
        NSLog(@"Error loading %@: %@", url, error.localizedDescription);
    } else {
        [player prepareToPlay];
    }
    return player;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myPlayer = [self loadWav:@"UhOh_Anya"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onBackButton:(id)sender {
    NSLog(@"onBackButton");
    
    AssignmentsTableViewController *assignmentsVC = [[AssignmentsTableViewController alloc] init];
    [self presentViewController:assignmentsVC animated:YES completion:NULL];
}

- (IBAction)onTap30:(UITapGestureRecognizer *)sender {
    self.rightOrWrongImage.image = [UIImage imageNamed:@"b49_wrong_mark"];
    [self.myPlayer play];
}

- (IBAction)onTap40:(UITapGestureRecognizer *)sender {
    self.rightOrWrongImage.image = [UIImage imageNamed:@"b49_correct_mark"];
}
@end
