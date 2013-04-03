//
//  ViewController.m
//  ring
//
//  Created by Steven on 13-4-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MainViewController ()<CLLocationManagerDelegate>{
    CLLocationManager *locationmanager;
    CLLocation *checkLocation;
    
    UILabel *lonLable;
    UILabel *latLable;
    
    UIImageView *arrowImageView;
    int heading;
}

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *img1 = [UIImage imageNamed:@"img1.jpg"];
    UIImageView *imgview1 = [[UIImageView alloc] initWithImage:img1];
    [imgview1 setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    NSLog(@"%f,%f",imgview1.frame.size.width,imgview1.frame.size.height);
    
    [self.view addSubview:imgview1];
    
    lonLable = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    latLable = [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 100, 50)];
    
    [self.view addSubview:lonLable];
    [self.view addSubview:latLable];
    
    arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    
    arrowImageView.center = CGPointMake(160, 240);
    
    [self.view addSubview:arrowImageView];
    
    
    locationmanager = [[CLLocationManager alloc] init];
        NSLog( @"Starting CLLocationManager" );
    locationmanager.delegate = self;
    locationmanager.distanceFilter = 200;
    locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationmanager startUpdatingLocation];
    
    heading = 0;
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testArrow) userInfo:nil repeats:YES];
    [timer fire];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//协议中的方法，作用是每当位置发生更新时会调用的委托方法
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //结构体，存储位置坐标
    CLLocationCoordinate2D loc = [newLocation coordinate];
    float longitude = loc.longitude; //经度
    float latitude = loc.latitude;//维度
    lonLable.text = [NSString stringWithFormat:@"%f",longitude];
    latLable.text = [NSString stringWithFormat:@"%f",latitude];
    
}

- (void)testArrow{
    heading += 5;
    NSLog(@"%d",heading);
    arrowImageView.transform = CGAffineTransformIdentity;
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(-1 * M_PI*(heading%360)/180.0);
    
    arrowImageView.transform = transform;
}
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    //每次要重置view的位置，才能保证图片每次偏转量正常，而不是叠加，指针方向正确。
    arrowImageView.transform = CGAffineTransformIdentity;
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(-1 * M_PI*newHeading.magneticHeading/180.0);
    
    
    //    CGAffineTransform transform = CGAffineTransformMakeTranslation(10, 50);
    arrowImageView.transform = transform;
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
//计算两个坐标之间的距离
+(double)distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2{
    CLLocation* curLocation = [[CLLocation alloc] initWithLatitude:lat1 longitude:lng1];
    CLLocation* otherLocation = [[CLLocation alloc] initWithLatitude:lat2 longitude:lng2];
    double distance  = [curLocation distanceFromLocation:otherLocation];
    return distance;
}
@end
