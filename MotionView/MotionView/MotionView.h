//
//  MotionView.h
//  MotionView
//
//  Created by weizhongming on 2017/6/22.
//  Copyright © 2017年 航磊_. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickImageBlock)(int imageIndex);

@interface MotionView : UIView

@property (nonatomic, copy) ClickImageBlock clickImageBlock;

/**
 MotionView初始化方法

 @param frame MotionView的frame
 @param imageArr 图片集合
 @param imageSize 图片大小
 @return MotionView
 */
- (instancetype)initWithFrame:(CGRect)frame imageNameArr:(NSArray *)imageArr imageSize:(CGSize)imageSize;

@end
