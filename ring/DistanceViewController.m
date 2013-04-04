//
//  DistanceViewController.m
//  ring
//
//  Created by Steven on 13-4-4.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "DistanceViewController.h"

@interface DistanceViewController ()
{
    NSMutableArray *numImageArray;
    UIImageView *mImageView;
}
@end

@implementation DistanceViewController
@synthesize disatnce;
@synthesize center;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        disatnce = 0;
        numImageArray = [[NSMutableArray alloc] initWithCapacity:10];
        for (int i=0; i<10; i++) {
            UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
            //UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
            //[imgView setFrame:CGRectMake(0, 0, 9, 12)];
            [numImageArray insertObject:img atIndex:i];
        }
        
        mImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"m.png"]];
        [mImageView setFrame:CGRectMake(0, 0, 14, 9)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)update{
    [self addNumViews];
}

- (void)addNumViews{
    for (UIView *subview in self.view.subviews) {
        [subview removeFromSuperview];
    }
    
    if (disatnce == 0) {
        
        UIImage *img0 = [numImageArray objectAtIndex:0];
        UIImageView *img0View = [[UIImageView alloc] initWithImage:img0];
        [img0View setFrame:CGRectMake(0, 0, 9, 12)];

        [mImageView setCenter:CGPointMake(center.x+7, center.y+1)];
        [img0View setCenter:CGPointMake(center.x-4, center.y)];

        [self.view addSubview:mImageView];
        [self.view addSubview:img0View];
    }
    else{
        int x = center.x;
        int y = center.y-20;
        
        int digitNum = 0;
        int num = disatnce;
        while (num>0) {
            digitNum += 1;
            num = num/10;
        }

        x += (10*digitNum+15)/2;
        x -= 7;
        [mImageView setCenter:CGPointMake(x, y+1)];
        [self.view addSubview:mImageView];
        x -= 5;
        num = disatnce;
        while (num>0) {
            x -= 10;
            UIImage *img = [numImageArray objectAtIndex:num%10];
            UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
            [imgView setFrame:CGRectMake(0, 0, 9, 12)];
            [imgView setCenter:CGPointMake(x, y)];
            [self.view addSubview:imgView];
            num = num/10;
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
