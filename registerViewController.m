//
//  registerViewController.m
//  ring
//
//  Created by Li Kaihua on 13-5-7.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "registerViewController.h"
#import "Ext.h"

@interface registerViewController ()<UITextFieldDelegate>{
    UITextField *txtEmail;
    UITextField *txtPassword;
}

@end

@implementation registerViewController

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
    [txtEmail setDelegate:self];
    [txtPassword setDelegate:self];
    
    
    UIImage *bgImage = [UIImage imageNamed:@"bg.jpg"];
    if ([Ext checkIphone5]) {
        bgImage = [UIImage imageNamed:@"5bg.jpg"];
    }
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    [bgView setFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    
    [self.view addSubview:bgView];
    
    UIImageView *userBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    UIImageView *passwordBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    
    [userBg setFrame:CGRectMake(0, 0, 140, 26)];
    [passwordBg setFrame:CGRectMake(0, 0, 140, 26)];
    
    [userBg setContentMode:UIViewContentModeCenter];
    [passwordBg setContentMode:UIViewContentModeCenter];
    
    [self.view addSubview:userBg];
    [self.view addSubview:passwordBg];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
