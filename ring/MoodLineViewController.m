//
//  MoodLineViewController.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MoodLineViewController.h"
#import "Ext.h"
#import "MoodLineView.h"

#define y1 150
#define y2 180
#define y3 210
#define y4 240

#define lineCenterX 170
#define lineWith 260
#define lineHeight 3

#define faceWith 24
#define faceHeight 24

#define faceCenterX 20


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
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_mood.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, -5, 60, 50);
    [self.view addSubview:backBtn];
    
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    shareBtn.frame = CGRectMake(0, 0, 64, 67);
    shareBtn.center = CGPointMake(160, [Ext screenSize].height-120);
    [self.view addSubview:shareBtn];

    
    
    UIImage *lineImage = [UIImage imageNamed:@"line1.png"];
    
    UIImageView *face1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face1.png"]];
    [face1 setFrame:CGRectMake(0, 0, faceWith, faceHeight)];
    face1.center = CGPointMake(faceCenterX, y1);
    [self.view addSubview:face1];
    UIImageView *moodLine1 = [[UIImageView alloc] initWithImage:lineImage];
    moodLine1.frame = CGRectMake(0, 0, lineWith, lineHeight);
    moodLine1.center = CGPointMake(lineCenterX, y1);
    [self.view addSubview:moodLine1];

    
    UIImageView *face2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face2.png"]];
    [face2 setFrame:CGRectMake(0, 0, faceWith, faceHeight)];
    face2.center = CGPointMake(faceCenterX, y2);
    [self.view addSubview:face2];
    UIImageView *moodLine2 = [[UIImageView alloc] initWithImage:lineImage];
    moodLine2.frame = CGRectMake(0, 0, lineWith, lineHeight);
    moodLine2.center = CGPointMake(lineCenterX, y2);
    [self.view addSubview:moodLine2];
    
    UIImageView *face3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face3.png"]];
    [face3 setFrame:CGRectMake(0, 0, faceWith, faceHeight)];
    face3.center = CGPointMake(faceCenterX, y3);
    [self.view addSubview:face3];
    UIImageView *moodLine3 = [[UIImageView alloc] initWithImage:lineImage];
    moodLine3.frame = CGRectMake(0, 0, lineWith, lineHeight);
    moodLine3.center = CGPointMake(lineCenterX, y3);
    [self.view addSubview:moodLine3];
    
    UIImageView *face4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face4.png"]];
    [face4 setFrame:CGRectMake(0, 0, faceWith, faceHeight)];
    face4.center = CGPointMake(faceCenterX, y4);
    [self.view addSubview:face4];
    UIImageView *moodLine4 = [[UIImageView alloc] initWithImage:lineImage];
    moodLine4.frame = CGRectMake(0, 0, lineWith, lineHeight);
    moodLine4.center = CGPointMake(lineCenterX, y4);
    [self.view addSubview:moodLine4];
    
    

     
    MoodLineView *moodLineView = [[MoodLineView alloc] initWithFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    [self.view addSubview:moodLineView];
    
    moodLineView.points = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(50, y1)],[NSValue valueWithCGPoint:CGPointMake(70, y2)],[NSValue valueWithCGPoint:CGPointMake(90, y1)],[NSValue valueWithCGPoint:CGPointMake(110, y4)],[NSValue valueWithCGPoint:CGPointMake(130, y1)],[NSValue valueWithCGPoint:CGPointMake(150, y2)],[NSValue valueWithCGPoint:CGPointMake(170, y1)],[NSValue valueWithCGPoint:CGPointMake(190, y4)], nil];
    
    moodLineView.x = 0;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.02f target:moodLineView selector:@selector(drawAction:) userInfo:nil repeats:YES];
    [timer fire];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
