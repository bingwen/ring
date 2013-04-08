//
//  LoginViewController.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "LoginViewController.h"
#import "Ext.h"
#import "LoginUITextField.h"

@interface LoginViewController ()<UITextFieldDelegate>{
    LoginUITextField *username;
    LoginUITextField *password;
}

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
    UIImage *bgImage = [UIImage imageNamed:@"4bg_login.jpg"];
    if ([Ext checkIphone5]) {
        bgImage = [UIImage imageNamed:@"5bg_login.jpg"];
    }
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    [bgView setFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    [self.view addSubview:bgView];
    
    UIImageView *userBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    UIImageView *passwordBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    UIImageView *loginBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login.png"]];
    
    [userBg setFrame:CGRectMake(0, 0, 140, 26)];
    [passwordBg setFrame:CGRectMake(0, 0, 140, 26)];
    [loginBg setFrame:CGRectMake(0, 0, 140, 25)];
    
    [userBg setCenter:CGPointMake([Ext screenSize].width/2,  [Ext screenSize].height/2-50-30)];
    [passwordBg setCenter:CGPointMake([Ext screenSize].width/2, [Ext screenSize].height/2-50)];
    [loginBg setCenter:CGPointMake([Ext screenSize].width/2,  [Ext screenSize].height/2-50+30)];
    
    [self.view addSubview:userBg];
    [self.view addSubview:passwordBg];
    [self.view addSubview:loginBg];
    
    username = [[LoginUITextField alloc] init];
    password = [[LoginUITextField alloc] init];
    [username setPlaceholder:@"新浪微博账号"];
    [password setPlaceholder:@"登录密码"];
    [password setSecureTextEntry:YES];
    
    username.font = [UIFont fontWithName:@"Arial" size:12.0f];
    password.font = [UIFont fontWithName:@"Arial" size:12.0f];
    username.textColor = [UIColor blackColor];
    password.textColor = [UIColor blackColor];
    username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    username.returnKeyType =UIReturnKeyNext;
    
    
    password.clearsOnBeginEditing = YES;
    
    username.alpha = 0.5;
    password.alpha = 0.5;
    username.delegate = self;
    password.delegate = self;
    [username setFrame:CGRectMake(0, 0, 110, 26)];
    [password setFrame:CGRectMake(0, 0, 110, 26)];
    [username setCenter:CGPointMake([Ext screenSize].width/2+15,  [Ext screenSize].height/2-50-30)];
    [password setCenter:CGPointMake([Ext screenSize].width/2+15,  [Ext screenSize].height/2-50)];
    
    [self.view addSubview:username];
    [self.view addSubview:password];
    
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
