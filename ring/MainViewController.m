//
//  ViewController.m
//  ring
//
//  Created by Steven on 13-4-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "Ext.h"
#import "sqlite3.h"
#import "PointView.h"
#import "DistanceViewController.h"
#import "LoginViewController.h"
#import "MoodViewController.h"
#import "MoodLineViewController.h"

@interface MainViewController ()<CLLocationManagerDelegate>{
    CLLocationManager *locationmanager;
    CLLocation *checkLocation;
    
    PointView *pointView;
    UIImageView *glowView;
    DistanceViewController *distanceViewController;
    int heading;
    double radius;
    CGPoint ringCenter;
    int distance;
}

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    distance = 100;
    
    UIImage *imgBg = [UIImage imageNamed:@"4bg_dusk.jpg"];
    if ([Ext checkIphone5]) {
        imgBg = [UIImage imageNamed:@"5bg_dusk.jpg"];
        NSLog(@"5");
    }
    UIImageView *imgviewBg = [[UIImageView alloc] initWithImage:imgBg];
    [imgviewBg setFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    [self.view addSubview:imgviewBg];
    
    glowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"glow.png"]];
    [glowView setFrame:CGRectMake(-100, -100, 32, 79)];
    [self.view addSubview:glowView];
    
    UIImage *imgRing = [UIImage imageNamed:@"ring.png"];
    UIImageView *imgviewRing = [[UIImageView alloc] initWithImage:imgRing];
    radius = 97;
    [imgviewRing setFrame:CGRectMake(0, 0, 2*(radius+5), 2*(radius+5))];
    ringCenter = CGPointMake([Ext screenSize].width/2, [Ext screenSize].height/2+10);
    imgviewRing.center = ringCenter;
    [self.view addSubview:imgviewRing];
    
    
    pointView = [[PointView alloc] initWithFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    [self.view addSubview:pointView];
    
    distanceViewController = [[DistanceViewController alloc] init];
    [self.view addSubview:distanceViewController.view];
    
    
    
    ////定位服务
    locationmanager = [[CLLocationManager alloc] init];
        NSLog( @"Starting CLLocationManager" );
    locationmanager.delegate = self;
    locationmanager.distanceFilter = 200;
    locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationmanager startUpdatingLocation];
    
    heading = 0;
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkPoint) userInfo:nil repeats:YES];
    [timer fire];
    
    if (NO) {
        LoginViewController *loginViewController = [[LoginViewController alloc] init];
        [loginViewController.view setFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
        [self.view addSubview:loginViewController.view];
    }
    if (NO) {
        MoodViewController *moodViewController = [[MoodViewController alloc] init];
        moodViewController.view.frame = CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height);
        [self.view addSubview:moodViewController.view];
    }
    if (YES) {
        MoodLineViewController *moodLine = [[MoodLineViewController alloc] init];
        moodLine.view.frame = CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height);
        [self.view addSubview:moodLine.view];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)checkPoint{
    
    heading += 1;
    double angle = (heading%360)*M_PI*2/360;
    
    double x = ringCenter.x + sin(angle)*radius;
    double y = ringCenter.y - cos(angle)*radius;
    
    double x2 = ringCenter.x + sin(angle)*(radius+30);
    double y2 = ringCenter.y - cos(angle)*(radius+30);
    
    double x3 = ringCenter.x + sin(angle)*(radius+13);
    double y3 = ringCenter.y - cos(angle)*(radius+13);

    [pointView setCenter:CGPointMake(x, y)];
    [distanceViewController setCenter:CGPointMake(x2, y2)];
    [pointView setNeedsDisplay];
    
    glowView.transform = CGAffineTransformMakeRotation(0.5*M_PI+angle);
    [glowView setCenter:CGPointMake(x3, y3)];

    [distanceViewController setDisatnce:(heading*1000)];
    [distanceViewController update];
    
}

//协议中的方法，作用是每当位置发生更新时会调用的委托方法
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //结构体，存储位置坐标
    CLLocationCoordinate2D loc = [newLocation coordinate];
    float longitude = loc.longitude; //经度
    float latitude = loc.latitude;//维度
    
    
}


-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    //每次要重置view的位置，才能保证图片每次偏转量正常，而不是叠加，指针方向正确。
        
    
    //    CGAffineTransform transform = CGAffineTransformMakeTranslation(10, 50);
}

//当位置获取或更新失败会调用的方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorMsg = nil;
    if ([error code] == kCLErrorDenied) {
        errorMsg = @"访问被拒绝";
    }
    if ([error code] == kCLErrorLocationUnknown) {
        errorMsg = @"获取位置信息失败";
    }
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Location"
                                                   message:errorMsg
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OtherBtn",nil];
    [alert show];
}

@end
