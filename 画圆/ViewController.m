//
//  ViewController.m
//  画圆
//
//  Created by  wuhiwi on 16/9/9.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCoreDrawView.h"
#import "HeigherDrawView.h"

#define kScreenWidth     ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight    ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    QuartzCoreDrawView *quartzCoreView = [[QuartzCoreDrawView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:quartzCoreView];
    
    
    HeigherDrawView *heigherDrawView = [[HeigherDrawView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:heigherDrawView];
}

@end
