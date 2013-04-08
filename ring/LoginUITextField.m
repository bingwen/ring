//
//  LoginUITextField.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "LoginUITextField.h"

@implementation LoginUITextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect
{
    //CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    [[UIColor blackColor] setFill];
    
    [[self placeholder] drawInRect:rect withFont:[UIFont systemFontOfSize:12]];
}

@end
