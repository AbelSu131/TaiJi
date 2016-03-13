//
//  TaijiView.m
//  TaiJi
//
//  Created by AbelSu on 16/3/12.
//  Copyright © 2016年 AbelSu. All rights reserved.
//

#import "TaijiView.h"

@implementation TaijiView

//初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        currentIndex = 0.0;
        self.backgroundColor = [UIColor clearColor]; //设置背景颜色
        //创建定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f/32.0f target:self selector:@selector(updateSpotlight) userInfo:nil repeats:YES];
    }
    return self;
}

//绘制太极
- (void)drawRect:(CGRect)rect
{
    float x = self.frame.size.width/2;
    float y = self.frame.size.height/2;
    float radius = self.frame.size.width/2; //获取半径
    //判断当前视图的宽度是否大于高度
    if(self.frame.size.width>self.frame.size.height)
    {
        radius = self.frame.size.height/2;
    }
    float runAngle = M_PI*currentIndex; //设置
    //判断
    if (runAngle >= 2*M_PI) {
        runAngle -= 2*M_PI;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext(); //创建图形上下文
    CGColorRef whiteColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:1] CGColor];
    CGColorRef blackColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor];
    //绘制半个白色的圆
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));//设置填充颜色
    CGContextAddArc(context, x, y, radius, 0+runAngle, M_PI+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    //绘制半个黑色的圆
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));//设置填充颜色
    CGContextAddArc(context, x, y, radius, M_PI+runAngle, M_PI*2+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    //在黑色的半圆上绘制一个白色的小半圆
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    CGContextAddArc(context, x+radius/2*cos(runAngle), y+radius/2*sin(runAngle), radius/2, M_PI+runAngle, M_PI*2+runAngle, 0);//添加弧
    CGContextClosePath(context);
    CGContextFillPath(context);
    //在白色的半圆上绘制一个黑色的小半圆
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x-radius/2*cos(runAngle), y-radius/2*sin(runAngle), radius/2, 0+runAngle, M_PI+runAngle, 0);//添加弧
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    
    //设置白色的线(直径)
    CGContextSetStrokeColorWithColor(context, whiteColor); //设置线的颜色
    CGContextMoveToPoint(context, x+radius*cos(runAngle), y+radius*sin(runAngle));
    CGContextAddLineToPoint(context, x, y); //设置结束点
    CGContextStrokePath(context);
    //设置黑色的线（直径）
    CGContextSetStrokeColorWithColor(context, blackColor); //设置线的颜色
    CGContextMoveToPoint(context, x-radius*cos(runAngle), y-radius*sin(runAngle));
    CGContextAddLineToPoint(context, x, y); //设置结束点
    CGContextStrokePath(context);
    
    //绘制白色的圆
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    CGContextAddArc(context, x-radius/2*cos(runAngle), y-radius/2*sin(runAngle), radius/4, 0, M_PI*2, 0); //添加弧
    CGContextClosePath(context);
    CGContextFillPath(context);
    //绘制黑色的圆
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x+radius/2*cos(runAngle), y+radius/2*sin(runAngle), radius/4, 0, M_PI*2, 0); //添加弧
    CGContextClosePath(context); //关闭路径
    CGContextFillPath(context);
}

//更新当前索引以及调用绘制方法
- (void)updateSpotlight
{
    currentIndex += 0.01;
    [self setNeedsDisplay]; // 重新绘制
}


@end
