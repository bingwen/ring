//
//  MoodLineViewController.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MoodLineViewController.h"
#import "Ext.h"

@interface MoodLineViewController ()

@end

@implementation MoodLineViewController

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
    UIImage *bgImage = [UIImage imageNamed:@"4bg_mood.jpg"];
    if ([Ext checkIphone5]) {
        bgImage = [UIImage imageNamed:@"5bg_mood.jpg"];
    }
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    [bgView setFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    [self.view addSubview:bgView];
    
    UIImageView *moodLineBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"curve_bg.png"]];
    moodLineBg.frame = CGRectMake(0, 100, 320, 115);
    moodLineBg.center = CGPointMake(160, 200);
    [self.view addSubview:moodLineBg];
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_mood.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, -5, 60, 50);
    [self.view addSubview:backBtn];
    
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    shareBtn.frame = CGRectMake(0, 0, 64, 67);
    shareBtn.center = CGPointMake(160, [Ext screenSize].height-120);
    [self.view addSubview:shareBtn];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
