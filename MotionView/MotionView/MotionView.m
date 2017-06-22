//
//  MotionView.m
//  MotionView
//
//  Created by weizhongming on 2017/6/22.
//  Copyright © 2017年 航磊_. All rights reserved.
//

#import "MotionView.h"
#import "MotionImageView.h"
#import "MotionViewTool.h"
@implementation MotionView

- (instancetype)initWithFrame:(CGRect)frame imageNameArr:(NSArray *)imageArr imageSize:(CGSize)imageSize{

    self = [super initWithFrame:frame];
    
    if (self) {
    
        int imgNumber = frame.size.width /imageSize.width;
        
        for (int i = 0; i < imageArr.count; i ++) {
            
            MotionImageView *motionImgView = [[MotionImageView alloc] initWithFrame:CGRectMake(imageSize.width *(i % imgNumber), imageSize.height *(i / imgNumber), imageSize.width, imageSize.height) imageName:imageArr[i]];
            motionImgView.tag = 100 +i;
            motionImgView.userInteractionEnabled = YES;
            [self addSubview:motionImgView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
            [motionImgView addGestureRecognizer:tap];
            
            
            MotionViewTool *tool = [MotionViewTool shareMotionViewTool];
            
            [tool addAimView:motionImgView referenceView:self];

        }
        
    }
    
    return self;
}

- (void)imageClick:(UITapGestureRecognizer *)tap{

    if (self.clickImageBlock) {
        
        self.clickImageBlock((int)tap.view.tag -100);
    }
}

@end
