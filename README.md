# Taiji
#### Taiji---自动旋转的太极

写的一个iOS简单动画，这个太极图其实就是由多个半圆以及两个圆组成，其中半圆以及圆都可以使用绘制弧线的方法CGContextAddArc来进行绘制。方法如下：

```
//绘制半个白色的圆
CGContextSetFillColor(context, CGColorGetComponents(whiteColor));//设置填充颜色
CGContextAddArc(context, x, y, radius, 0+runAngle, M_PI+runAngle, 0);
CGContextClosePath(context);
CGContextFillPath(context);
```
其次，自动旋转的实现是使用scheduledTimerWithTimeInterval: target: selector: userInfo: repeats:的方法创建一个时间定时器，代码如下：

```
//创建定时器
_timer = [NSTimer scheduledTimerWithTimeInterval:1.0f/32.0f target:self selector:@selector(updateSpotlight) userInfo:nil repeats:YES];
```
此方法是每隔 1.0f/32.0f 秒，就会调用updateSpotlight方法，在updateSpotlight方法中会对currentIndex实例变量进行赋值，然后再对太极进行重绘，此时的currentIndex就是绘制太极的关键参数。


效果如下：

![snowgif](https://raw.githubusercontent.com/AbelSu131/TaiJi/master/tj.gif)
