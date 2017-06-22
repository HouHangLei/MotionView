//
//  ViewController.m
//  MotionView
//
//  Created by weizhongming on 2017/6/22.
//  Copyright © 2017年 航磊_. All rights reserved.
//

#import "ViewController.h"
#import "MotionView.h"
#import "MotionViewTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    MotionView *motionView = [[MotionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imageNameArr:@[@"图片1",@"图片2",@"图片3",@"图片4",@"图片5",@"图片6",@"图片7",@"图片8",@"图片9",@"图片10",@"图片11"] imageSize:CGSizeMake(40,40)];
    motionView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:motionView];
    
    motionView.clickImageBlock = ^(int imageIndex) {
      
        NSLog(@"%d",imageIndex);
    };
}

- (void)viewDidDisappear:(BOOL)animated{

    [[MotionViewTool shareMotionViewTool] stopMotion];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
