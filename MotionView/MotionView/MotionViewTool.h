//
//  MotionViewTool.h
//  MotionView
//
//  Created by weizhongming on 2017/6/22.
//  Copyright © 2017年 航磊_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MotionViewTool : NSObject

@property (nonatomic, weak) UIView *referenceView;

+ (instancetype)shareMotionViewTool;

/**
 给view添加行为

 @param aimView 目标view
 @param referenceView 参考view
 */
- (void)addAimView:(UIView *)aimView referenceView:(UIView *)referenceView;

- (void)stopMotion;


@end
