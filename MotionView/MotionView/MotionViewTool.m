//
//  MotionViewTool.m
//  MotionView
//
//  Created by weizhongming on 2017/6/22.
//  Copyright © 2017年 航磊_. All rights reserved.
//

#import "MotionViewTool.h"
#import <CoreMotion/CoreMotion.h>

@interface MotionViewTool ()

/**
 运动管理者
 */
@property (nonatomic, strong) CMMotionManager *manager;

/**
 物理行为（动态媒介）
 */
@property (nonatomic, strong) UIDynamicAnimator *animator;

/**
 重力行为
 */
@property (nonatomic, strong) UIGravityBehavior *gravity;

/**
 碰撞行为
 */
@property (nonatomic, strong) UICollisionBehavior *collision;

/**
 动力学属性
 */
@property (nonatomic, strong) UIDynamicItemBehavior *dynamic;

@end


@implementation MotionViewTool

static dispatch_once_t onceToken;

+ (instancetype)shareMotionViewTool{

    static MotionViewTool * tool;
    
    dispatch_once(&onceToken, ^{
        
        tool = [[MotionViewTool alloc] init];
        
    });
    
    return tool;
}

- (void)addAimView:(UIView *)aimView referenceView:(UIView *)referenceView{

    _referenceView = referenceView;
    
    [self.dynamic addItem:aimView];
    [self.collision addItem:aimView];
    [self.gravity addItem:aimView];
    
    [self run];

}

- (void)run{

    self.manager.deviceMotionUpdateInterval = 0.01;
    
    __weak typeof(self) weakSelf = self;
    
    [self.manager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"出错了 %@",error);
            return;
        }
        weakSelf.gravity.gravityDirection = CGVectorMake(motion.gravity.x * 3, -motion.gravity.y * 3);
    }];
}

- (CMMotionManager *)manager{

    if (!_manager) {
        
        _manager = [[CMMotionManager alloc] init];
    }
    return _manager;
}

- (UIDynamicAnimator *)animator{

    if (!_animator) {
        
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.referenceView];
    }
    return _animator;
}

- (UIGravityBehavior *)gravity{

    if (!_gravity) {
        
        _gravity = [[UIGravityBehavior alloc] init];
        [self.animator addBehavior:_gravity];
    }
    return _gravity;
}

- (UICollisionBehavior *)collision{

    if (!_collision) {
        
        _collision = [[UICollisionBehavior alloc] init];
        _collision.translatesReferenceBoundsIntoBoundary = YES;
/**
 collisionMode: 碰撞模式
 《1》UICollisionBehaviorModeItems 元素碰撞
 《2》UICollisionBehaviorModeBoundaries 边境碰撞
 《3》UICollisionBehaviorModeEverything 所有都可以碰撞
        */
        _collision.collisionMode = UICollisionBehaviorModeEverything;
        [self.animator addBehavior:_collision];
    }
    return _collision;
}

- (UIDynamicItemBehavior *)dynamic{

    if (!_dynamic) {
        
        _dynamic = [[UIDynamicItemBehavior alloc] init];
       
/**
 摩擦力系数
 */
        _dynamic.friction = 0.2f;
        
/**
 弹性系数 在0~1之间
 */
        _dynamic.elasticity = 0.8f;
        
/**
  跟size大小相关，计算物体块的质量。
 */
        _dynamic.density = 0.2f;
        
/**
 是否能旋转
 */
        _dynamic.allowsRotation = YES;
        
/**
 阻力系数
 */
        _dynamic.resistance = 0;
        [self.animator addBehavior:_dynamic];
    }
    return _dynamic;
}

- (void)stopMotion{

    if (self.manager.isDeviceMotionActive) {
        [self.manager stopDeviceMotionUpdates];
        [self.animator removeAllBehaviors];
        onceToken = 0;
    }
}


@end
