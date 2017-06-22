# MotionView
### ****仿膜拜我的贴纸页图片滚动****

由于只能用真机测试，所以录的是模拟器的初始效果图，可以下载下来跑到真机上看实际效果。

模拟器的效果图

![myGif.gif](http://upload-images.jianshu.io/upload_images/3643442-93a77582c937f7d6.gif?imageMogr2/auto-orient/strip)


## ****使用方法****
1.导入#import "MotionView.h"
2.初始化方法
```
/**
 MotionView初始化方法

 @param frame MotionView的frame
 @param imageArr 图片集合
 @param imageSize 图片大小
 @return MotionView
 */
- (instancetype)initWithFrame:(CGRect)frame imageNameArr:(NSArray *)imageArr imageSize:(CGSize)imageSize;
```

##### ****使用示例****
```
   MotionView *motionView = [[MotionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imageNameArr:@[@"图片1",@"图片2",@"图片3"] imageSize:CGSizeMake(40,40)];  
   [self.view addSubview:motionView];
    
 // 点击图片后的回调，imageIndex--点击的第几张图片，可不写    
    motionView.clickImageBlock = ^(int imageIndex) {
      
        NSLog(@"%d",imageIndex);
    };
```

