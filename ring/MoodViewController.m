//
//  MoodViewController.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MoodViewController.h"
#import "Ext.h"
#import <QuartzCore/QuartzCore.h>

@interface MoodViewController (){
    UIButton *backBtn;
}
- (IBAction)backPressed:(id)sender;
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
    
    backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_mood.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, -5, 60, 50);
    if ([self respondsToSelector:@selector(backPressed:)]) {
        [backBtn addTarget:self action:@selector(backPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view addSubview:backBtn];
    
    
    
    UIImageView *userImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user1.png"]];
    userImage.frame = CGRectMake(0, 0, 26, 20);
    userImage.center = CGPointMake(26, 205);
    [self.view addSubview:userImage];
    
    
    UIButton *sendBtn = [[UIButton alloc] init];
    [sendBtn setBackgroundImage:[UIImage imageNamed:@"send.png"] forState:UIControlStateNormal];
    [sendBtn setBackgroundImage:[UIImage imageNamed:@"send1.png"] forState:UIControlStateSelected];
    sendBtn.frame = CGRectMake(0, 0, 100, 20);
    sendBtn.center = CGPointMake(250, 205);
    
    [self.view addSubview:sendBtn];
	// Do any additional setup after loading the view.
}

- (IBAction)backPressed:(id)sender{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.delegate = self;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    animation.removedOnCompletion = YES;
    [self.view.superview.layer addAnimation:animation forKey:@"mood-back"];
    [self.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
