//
//  ViewController.m
//  TaiJi
//
//  Created by AbelSu on 16/3/12.
//  Copyright © 2016年 AbelSu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    taiji = [[TaijiView alloc]initWithFrame:CGRectMake(50.0f, 80.0f, 230.0f, 320.0f)]; //实例化对象
    [self.view addSubview:taiji];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
