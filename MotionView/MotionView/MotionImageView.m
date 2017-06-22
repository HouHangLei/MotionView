//
//  MotionImageView.m
//  MotionView
//
//  Created by weizhongming on 2017/6/22.
//  Copyright © 2017年 航磊_. All rights reserved.
//

#import "MotionImageView.h"

@interface MotionImageView ()

/**
  在UIDynamicItemGroup类中，有一个collisionBoundsType的属性，可以修改属性值，进而修改控件的碰撞边缘。但这个属性是只读的，所以需要创建一个继承自UIView的类，改写这个属性
 */
@property (nonatomic, assign) UIDynamicItemCollisionBoundsType collisionBoundsType;

@end

@implementation MotionImageView

@synthesize collisionBoundsType;

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.image = [UIImage imageNamed:imageName];
        self.layer.cornerRadius = frame.size.width /2;
        self.layer.masksToBounds = YES;
        self.collisionBoundsType = UIDynamicItemCollisionBoundsTypeEllipse;
        
    }
    return self;
}

@end
