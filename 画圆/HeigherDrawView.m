//
//  HeigherDrawView.m
//  画圆
//
//  Created by  wuhiwi on 16/9/18.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "HeigherDrawView.h"

@implementation HeigherDrawView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    return self;
}
- (void)drawRect:(CGRect)rect
{
    //第一种绘图形式：在UIView的子类方法drawRect：中绘制一个蓝色圆，使用UIKit在Cocoa为我们提供的当前上下文中完成绘图任务。
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    bezierPath.lineWidth = 0.5;
    [[UIColor blueColor] setStroke];
    [bezierPath stroke];
    
    
    //第二种绘图形式：使用Core Graphics实现绘制蓝色圆。
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    CGContextAddEllipseInRect(context, CGRectMake(120, 0, 100, 100));
    CGContextDrawPath(context, kCGPathStroke);
}

@end
