//
//  MoodLineView.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MoodLineView.h"

@implementation MoodLineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
  //  CGContextAddArc(context, center.x, center.y, radius, 0.0f, 2.0f * M_PI, YES);
    CGContextFillPath(context);
}


@end
