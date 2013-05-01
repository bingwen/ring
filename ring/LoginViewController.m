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
    LoginUITextField *txtUsername;
    LoginUITextField *txtPassword;
    
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
    [self.view endEditing:YES];
    UIImage *bgImage = [UIImage imageNamed:@"bg.jpg"];
    if ([Ext checkIphone5]) {
        bgImage = [UIImage imageNamed:@"5bg.jpg"];
    }
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    [bgView setFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    [self.view addSubview:bgView];
    
    UIImageView *userBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    UIImageView *passwordBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    UIImageView *loginBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login.png"]];
    UIImageView *signinBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"signin.png"]];
    
    
    UIButton *btnLogin = [[UIButton alloc] initWithFrame:CGRectMake(0,0,140,25)];
    
    
    [userBg setFrame:CGRectMake(0, 0, 140, 26)];
    [passwordBg setFrame:CGRectMake(0, 0, 140, 26)];
    [loginBg setFrame:CGRectMake(0, 0, 140, 25)];
    
    [userBg setCenter:CGPointMake([Ext screenSize].width/2,  [Ext screenSize].height/2-50-30)];
    [passwordBg setCenter:CGPointMake([Ext screenSize].width/2, [Ext screenSize].height/2-50)];
    [loginBg setCenter:CGPointMake([Ext screenSize].width/2,  [Ext screenSize].height/2-50+30)];
    
    [self.view addSubview:userBg];
    [self.view addSubview:passwordBg];
    [self.view addSubview:loginBg];
    
    txtUsername = [[LoginUITextField alloc] init];
    txtPassword = [[LoginUITextField alloc] init];
    [txtUsername setPlaceholder:@"Email/Username"];
    [txtPassword setPlaceholder:@"Password"];
    [txtPassword setSecureTextEntry:YES];
    
    txtUsername.font = [UIFont fontWithName:@"Arial" size:12.0f];
    txtPassword.font = [UIFont fontWithName:@"Arial" size:12.0f];
    txtUsername.textColor = [UIColor blackColor];
    txtPassword.textColor = [UIColor blackColor];
    txtUsername.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtUsername.returnKeyType =UIReturnKeyNext;
    
    
    txtPassword.clearsOnBeginEditing = YES;
    
    txtUsername.alpha = 0.5;
    txtPassword.alpha = 0.5;
    txtUsername.delegate = self;
    txtPassword.delegate = self;
    [txtUsername setFrame:CGRectMake(0, 0, 110, 26)];
    [txtPassword setFrame:CGRectMake(0, 0, 110, 26)];
    [txtUsername setCenter:CGPointMake([Ext screenSize].width/2+15,  [Ext screenSize].height/2-50-30)];
    [txtPassword setCenter:CGPointMake([Ext screenSize].width/2+15,  [Ext screenSize].height/2-50)];
    
    [self.view addSubview:txtUsername];
    [self.view addSubview:txtPassword];
    
	// Do any additional setup after loading the view.
}

-(IBAction)btnLogin:(id)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
