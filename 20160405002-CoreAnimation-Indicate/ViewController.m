//
//  ViewController.m
//  20160405002-CoreAnimation-Indicate
//
//  Created by Rainer on 16/4/5.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *backView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建一个复制层对象
    CAReplicatorLayer *replicatoreLayer = [CAReplicatorLayer layer];
    
    // 2.设置复制层对象的属性
    // 2.1.定义相关信息
    // 定义点复制层的数量
    int count = 20;
    // 计算每一个点旋转的角度
    CGFloat angle = M_PI * 2 / count;
    // 定义延迟时间
    CGFloat duration = 1;
    
    // 2.2.设置复制层的位置大小
    replicatoreLayer.frame = self.backView.bounds;
    // 2.3.设置复制层的数量
    replicatoreLayer.instanceCount = count;
    // 2.4.设置复制层旋转的属性
    replicatoreLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    // 2.5.设置复制层延迟的时间
    replicatoreLayer.instanceDelay = duration / count;
    
    
    // 3.创建一个图层对象
    CALayer *layer = [CALayer layer];
    
    // 4.设置图层的属性
    // 4.1.设置图层的位置属性
    layer.position = CGPointMake(self.backView.bounds.size.width * 0.5, 20);
    // 4.2.设置图层的大小
    layer.bounds = CGRectMake(0, 0, 10, 10);
    // 4.3.设置图层的背景颜色
    layer.backgroundColor = [UIColor blueColor].CGColor;
    // 4.4.初始化图层的缩放属性
    layer.transform = CATransform3DMakeScale(0, 0, 0);
    
    
    // 5.创建一个基础动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    
    // 6.设置动画的属性
    // 6.1.设置动画的属性Key
    basicAnimation.keyPath = @"transform.scale";
    // 6.2.设置动画的变化前值
    basicAnimation.fromValue = @1;
    // 6.3.设置动画的变化后值
    basicAnimation.toValue = @0;
    // 6.4.设置动画的重复次数
    basicAnimation.repeatCount = MAXFLOAT;
    // 6.5.设置动画的执行时长
    basicAnimation.duration = duration;
    
    
    // 7.将动画添加到layer层
    [layer addAnimation:basicAnimation forKey:nil];
    
    // 8.将layer层添加到复制层
    [replicatoreLayer addSublayer:layer];
    
    // 9.将复制层添加到视图上
    [self.backView.layer addSublayer:replicatoreLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
