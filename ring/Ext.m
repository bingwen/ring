//
//  Ext.m
//  ring
//
//  Created by Steven on 13-4-4.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "Ext.h"
#import <CoreLocation/CoreLocation.h>

@implementation Ext

+(bool)checkIphone5
{
    return [UIScreen mainScreen].bounds.size.height == 568;
}

+(CGSize)screenSize{
    return [UIScreen mainScreen].bounds.size;
}

//计算两个坐标之间的距离
+(double)distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2{
    CLLocation* curLocation = [[CLLocation alloc] initWithLatitude:lat1 longitude:lng1];
    CLLocation* otherLocation = [[CLLocation alloc] initWithLatitude:lat2 longitude:lng2];
    double distance  = [curLocation distanceFromLocation:otherLocation];
    return distance;
}

@end

@implementation NSString (extention)

+ (NSString *)documentPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    return [paths objectAtIndex:0];
}

@end
