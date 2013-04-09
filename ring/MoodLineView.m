//
//  MoodLineView.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MoodLineView.h"

#define xStartPoint 10.0f
#define xEndPoint 300.0f

@interface MoodLineView (){
}
@end

@implementation MoodLineView
@synthesize points;
@synthesize x;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.color = [UIColor purpleColor];
        x = 0;
        [self setBackgroundColor:[UIColor clearColor]];

    }
    return self;
}

- (void)drawAction:(NSTimer *)timer{
    x += 1;
    [self setNeedsDisplay];
    if (x>320) {
        [timer invalidate];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawMoodLine];
    [self drawMoodPoint];
}

- (void)drawMoodPoint{
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (NSValue *value in self.points) {
        CGPoint _point = [value CGPointValue];
        if (_point.x < x) {
            CGContextSetFillColorWithColor(context, [self.color CGColor]);
            CGContextAddArc(context, _point.x, _point.y, 3*2, 0.0f, 2.0f * M_PI, YES);
            CGContextFillPath(context);
            CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
            CGContextAddArc(context, _point.x, _point.y, 2, 0.0f, 2.0f * M_PI, YES);
            CGContextFillPath(context);
        }
    }
}

- (void)drawMoodLine{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [self.color CGColor]);
    
    CGContextSetLineWidth(ctx, 3.0);
    //设置线条样式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    //设置画笔颜色
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextSetStrokeColorWithColor(ctx, [self.color CGColor]);
    //画点连线
    if ([self.points count]>=2) {
        CGPoint _startPoint = [(NSValue *)[self.points objectAtIndex:0] CGPointValue];
        CGPoint _lastPoint = _startPoint;
        CGContextMoveToPoint(ctx, _startPoint.x, _startPoint.y);
        for (int index = 1; index<[self.points count]; index++)
        {
            if (_lastPoint.x>x) {
                break;
            }
            CGPoint _point = [(NSValue *)[self.points objectAtIndex:index] CGPointValue];
            if (_point.x<=x) {
                CGContextAddLineToPoint(ctx, _point.x, _point.y);
            }
            else{
                int _y = (x-_lastPoint.x)/(_point.x-_lastPoint.x)*(_point.y-_lastPoint.y)+_lastPoint.y;
                CGContextAddLineToPoint(ctx, x, _y);
            }
            _lastPoint = _point;
        }
        //CGContextClosePath(ctx);//闭合线条
        CGContextStrokePath(ctx);
        CGContextFillPath(ctx);
    }
}


@end
