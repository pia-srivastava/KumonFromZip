//
//  B49ViewController.m
//  KumonApp
//
//  Created by Pia Srivastava on 2/24/14.
//  Copyright (c) 2014 malena mesarina. All rights reserved.
//

#import "B49ViewController.h"

@interface B49ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *b49_background = [UIImage imageNamed:@"b49_background.png"];
    self.backgroundImage.image = b49_background;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
