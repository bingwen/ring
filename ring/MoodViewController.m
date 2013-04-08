//
//  MoodViewController.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MoodViewController.h"
#import "Ext.h"

@interface MoodViewController ()

@end

@implementation MoodViewController

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
    
    UIImageView *moodBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mood_bg.png"]];
    moodBg.frame = CGRectMake(0, 0, 320, 198);
    [self.view addSubview:moodBg];
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_mood.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, -5, 60, 50);
    [self.view addSubview:backBtn];
    
    UIButton *inviteBtn = [[UIButton alloc] init];
    [inviteBtn setBackgroundImage:[UIImage imageNamed:@"invite.png"] forState:UIControlStateNormal];
    inviteBtn.frame = CGRectMake(0, 190, 177, 29);
    inviteBtn.center = CGPointMake(80, 205);
    [self.view addSubview:inviteBtn];
    
    UIButton *sendBtn = [[UIButton alloc] init];
    [sendBtn setBackgroundImage:[UIImage imageNamed:@"send.png"] forState:UIControlStateNormal];
    sendBtn.frame = CGRectMake(0, 0, 120, 24);
    sendBtn.center = CGPointMake(240, 205);
    [self.view addSubview:sendBtn];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
