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

@property (weak, nonatomic) IBOutlet UIImageView *rightOrWrongImage1;
@property (weak, nonatomic) IBOutlet UIImageView *rightOrWrongImage2;
@property (weak, nonatomic) IBOutlet UIImageView *rightOrWrongImage3;
@property (weak, nonatomic) IBOutlet UIImageView *rightOrWrongImage4;

- (IBAction)onBackButton:(id)sender;
- (IBAction)onTap30:(UITapGestureRecognizer *)sender;
- (IBAction)onTap40:(UITapGestureRecognizer *)sender;
- (IBAction)onTap82:(UITapGestureRecognizer *)sender;
- (IBAction)onTap28:(UITapGestureRecognizer *)sender;
- (IBAction)onTap90:(UITapGestureRecognizer *)sender;
- (IBAction)onTap53:(UITapGestureRecognizer *)sender;
- (IBAction)onTap24:(UITapGestureRecognizer *)sender;
- (IBAction)onTap19:(UITapGestureRecognizer *)sender;

-(void)showHearRightWrong:(UIImageView *)rightOrWrongImage soundFile:(NSString *)nameOfSoundFile rightOrWrong:(NSString *)rightOrWrong;

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
    
    self.navigationController.navigationBar.hidden = YES;

    self.rightOrWrongImage1.alpha = 0;
    self.rightOrWrongImage2.alpha = 0;
    self.rightOrWrongImage3.alpha = 0;
    self.rightOrWrongImage4.alpha = 0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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

- (IBAction)onTap30:(UITapGestureRecognizer *)sender {
    [self showHearRightWrong:self.rightOrWrongImage1 soundFile:@"UhOh_Anya" rightOrWrong:@"wrong"];
}

- (IBAction)onTap40:(UITapGestureRecognizer *)sender {
    [self showHearRightWrong:self.rightOrWrongImage1 soundFile:@"Awesome_Avik" rightOrWrong:@"right"];
}

- (IBAction)onTap82:(UITapGestureRecognizer *)sender {
    [self showHearRightWrong:self.rightOrWrongImage2 soundFile:@"GoodJob_Avik" rightOrWrong:@"right"];
}

- (IBAction)onTap90:(UITapGestureRecognizer *)sender {
    [self showHearRightWrong:self.rightOrWrongImage3 soundFile:@"Superb_Avik" rightOrWrong:@"right"];
}

- (IBAction)onTap53:(UITapGestureRecognizer *)sender {
    [self showHearRightWrong:self.rightOrWrongImage3 soundFile:@"DontGiveUp_Avik" rightOrWrong:@"wrong"];
}

- (IBAction)onTap19:(UITapGestureRecognizer *)sender {
    [self showHearRightWrong:self.rightOrWrongImage4 soundFile:@"NiceTry_Avik" rightOrWrong:@"wrong"];
}

- (IBAction)onTap24:(UITapGestureRecognizer *)sender {
    [self showHearRightWrong:self.rightOrWrongImage4 soundFile:@"Terrific_Anya" rightOrWrong:@"right"];
}

- (IBAction)onTap28:(UITapGestureRecognizer *)sender {
    [self showHearRightWrong:self.rightOrWrongImage2 soundFile:@"NotQuite_Anya" rightOrWrong:@"wrong"];
}


-(void)showHearRightWrong:(UIImageView *)rightOrWrongImage soundFile:(NSString *)nameOfSoundFile rightOrWrong:(NSString *)rightOrWrong{
    rightOrWrongImage.alpha = 1;
    NSString *imageToShow;
    if([rightOrWrong isEqualToString:@"wrong"]){
        imageToShow = @"b49_wrong_mark";
    }
    else{
        imageToShow = @"b49_correct_mark";
    }
    rightOrWrongImage.image = [UIImage imageNamed:imageToShow];
    
    //First check if they even want to hear sound!
    NSString *sound = [[NSUserDefaults standardUserDefaults] objectForKey:@"sound"];
    NSLog(@"sound coming in is [%@]", sound);
    if([sound isEqualToString:@"on"]){
        self.myPlayer = [self loadWav:nameOfSoundFile];
        [self.myPlayer play];
    }
}

@end
