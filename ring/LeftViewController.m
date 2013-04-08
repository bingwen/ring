//
//  LeftViewController.m
//  ring
//
//  Created by Steven on 13-4-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "LeftViewController.h"
#import "Ext.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

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
    UIImageView * bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4bg_setting.jpg"]];
    if ([Ext checkIphone5]) {
        bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"5bg_setting.jpg"]];
    }
    [self.view addSubview:bg];
    
    UIImageView *smileView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face_smile.png"]];
    [smileView setFrame:CGRectMake(12, [Ext screenSize].height-70, 35, 35)];
    [self.view addSubview:smileView];
    
    UIImageView *moreView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"more.png"]];
    [moreView setFrame:CGRectMake(8, 10, 44, 59)];
    [self.view addSubview:moreView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
