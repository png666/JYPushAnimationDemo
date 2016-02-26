//
//  UINavigationController+PushAnimation.h
//  JYItem
//
//  Created by Dely on 16/2/24.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger ,PushType) {
    PushDefault = 0,    //系统默认
    PushCurlUp,         //向上翻一页
    PushCurlDown,       //向下翻一页
    PushFilpFromLeft,   //从左翻转
    PushFilpFromRight,  //从右翻转
    PushFade,           //交叉淡化过渡
    PushMoveIn,         //新视图移到旧视图上面 依靠animationSubtype方向
    PushReveal,         //将旧视图移开，显示下面的新视图 依靠animationSubtype方向
    PushPush,           //推挤
    PushCube,           //立方体效果 依靠animationSubtype方向
    PushPageCurl,       //翻页 依靠animationSubtype方向
    PushPageUnCurl,     //反翻页 依靠animationSubtype方向
    PushRippleEffect,   //滴水效果
    PushSuckEffect,      //收缩效果
    PushCameraIrisHollowOpen,  //镜头开
    PushCameraIrisHollowClose //镜头关
};

@interface UINavigationController (PushAnimation)

@property (nonatomic, assign) PushType pushAnimationType;//push效果

/**
 *  kCATransitionFromRight
 *  kCATransitionFromLeft
 *  kCATransitionFromTop
 *  kCATransitionFromBottom
 */
@property (nonatomic, strong) NSString *animationSubtype;//push方向

- (void)pushAnmiationViewController:(UIViewController *)viewController;

@end
