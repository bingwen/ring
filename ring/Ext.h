//
//  Ext.h
//  ring
//
//  Created by Steven on 13-4-4.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ext : NSObject
+(bool)checkIphone5;
+(CGSize)screenSize;
+(double)distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2;
@end

@interface NSString (extention)
+ (NSString *)documentPath;
@end
