//
//  registerViewController.m
//  ring
//
//  Created by Li Kaihua on 13-5-7.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "registerViewController.h"

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
    
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
