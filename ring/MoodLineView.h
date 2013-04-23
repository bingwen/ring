//
//  MoodLineView.h
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoodLineView : UIView
@property (nonatomic,strong) NSArray *points;
@property (nonatomic,assign) int x;
@property (nonatomic,assign) int y;
@property (nonatomic,assign) double bottomY;
@property (nonatomic,strong) UIColor *color;
@end
