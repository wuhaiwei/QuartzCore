//
//  QuartzCoreDrawView.m
//  画圆
//
//  Created by  wuhiwi on 16/9/14.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "QuartzCoreDrawView.h"
#import <QuartzCore/QuartzCore.h>

//http://www.360doc.com/content/13/1228/16/8310724_340792339.shtml
//http://www.cnblogs.com/wxios/p/4533106.html
static CGFloat const PI = 3.1415926;

@implementation QuartzCoreDrawView
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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIFont *font = [UIFont italicSystemFontOfSize:15.0];
    UIColor *color = [UIColor blueColor];
    NSDictionary *attributeDic = @{NSFontAttributeName:font,NSForegroundColorAttributeName:color};
    
    //画文字:
    [@"画圆:" drawInRect:CGRectMake(10, 40, 80, 20) withAttributes:attributeDic];
    [@"画线及弧线:" drawInRect:CGRectMake(10, 120, 100, 20) withAttributes:attributeDic];
    [@"画矩形:" drawInRect:CGRectMake(10, 180, 80, 20) withAttributes:attributeDic];
    [@"画扇形和椭圆:" drawInRect:CGRectMake(10, 240, 110, 20) withAttributes:attributeDic];
    [@"画三角形:" drawInRect:CGRectMake(10, 300, 80, 20) withAttributes:attributeDic];
    [@"画圆角矩形:" drawInRect:CGRectMake(10, 360, 100, 20) withAttributes:attributeDic];
    [@"画贝塞尔曲线:" drawInRect:CGRectMake(10, 420, 100, 20) withAttributes:attributeDic];
    [@"图片:" drawInRect:CGRectMake(10, 480, 80, 20) withAttributes:attributeDic];

    //画圆
    //边框圆
    //画笔线的颜色
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 1, 1);
    //线的宽度
    CGContextSetLineWidth(context, 1.0);
    //添加一个圆：x，y为圆点坐标，radius为半径，startAngle为开始的弧度，endAngle为结束的弧度，clockwise 0为顺时针，1为逆时针
    CGContextAddArc(context, 100, 50, 15, 0, 2 * PI, 0);
    //绘制路径
    CGContextDrawPath(context, kCGPathStroke);
    
    
    //画填充圆
    CGContextAddArc(context, 150, 50, 20, 0, 2 * PI, 0);
    //填充绘制
    CGContextDrawPath(context, kCGPathFill);
    
    
    //画圆并填充内部颜色
    UIColor *aColor = [UIColor colorWithRed:0.5 green:1.0 blue:0.5 alpha:1.0];
    //填充颜色
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    CGContextSetLineWidth(context, 3.0);
    CGContextAddArc(context, 250, 50, 30, 0, 2 * PI, 0);
    //KCGPathFill填充非零绕数规则，KCGPathEOFill表示用奇偶规则，KCGPathStroke路径，kCGPathFillStroke路径填充，kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    //画线及弧线
    //画线
    CGPoint aPoints[2];
    aPoints[0] = CGPointMake(120, 130);
    aPoints[1] = CGPointMake(160, 130);
    CGContextSetLineWidth(context, 1.0);
    //CGContextAddLines(上下文, poinst[]数组, count大小)
    CGContextAddLines(context, aPoints, 2);
    CGContextDrawPath(context, kCGPathStroke);
    
    //画弧线
    //左
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    CGContextMoveToPoint(context, 180, 140);
    CGContextAddArcToPoint(context, 200, 120, 220, 140, 20);
    CGContextStrokePath(context);
    //右
    CGContextMoveToPoint(context, 240, 120);
    CGContextAddArcToPoint(context, 260, 140, 280, 120, 20);
    CGContextStrokePath(context);
    
    
    
    //画矩形
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextAddRect(context, CGRectMake(100, 180, 50, 50));
    CGContextDrawPath(context, kCGPathFill);
    
    
    //画扇形  画部分圆
    CGContextMoveToPoint(context, 150, 250);
    CGContextAddArc(context, 150, 250, 30, 60 * PI / 180, 120 * PI / 180, 0);
    CGContextDrawPath(context, kCGPathFill);
    
    
    //画椭圆
    CGContextAddEllipseInRect(context, CGRectMake(240, 240, 50, 30));
    CGContextDrawPath(context, kCGPathFill);
    
    
    //画三角形
    CGPoint bPoints[3];
    bPoints[0] = CGPointMake(150, 300);
    bPoints[1] = CGPointMake(120, 350);
    bPoints[2] = CGPointMake(180, 350);
    CGContextAddLines(context, bPoints, 3);
    CGContextDrawPath(context, kCGPathFill);
    
    
    //画贝塞尔曲线
    CGContextMoveToPoint(context, 120, 420);
    //二次曲线
    //设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextAddQuadCurveToPoint(context, 140, 450, 180, 460);
    CGContextStrokePath(context);
    
    //三次曲线
    CGContextMoveToPoint(context, 190, 420);
    CGContextAddCurveToPoint(context, 210, 450, 250, 400, 280, 430);
    CGContextStrokePath(context);
    
    
    
    //图片
    UIImage *image = [UIImage imageNamed:@"QQ20160918-0"];
//    [image drawInRect:CGRectMake(100, 500, 80, 80)];
    [image drawAtPoint:CGPointMake(100, 500)];
    //这个会倒置图片
//    CGContextDrawImage(context, CGRectMake(100, 500, 80, 80), image.CGImage);
    //平图图
//    CGContextDrawTiledImage(context, CGRectMake(0, 0, 80, 80), image.CGImage);
}
@end
