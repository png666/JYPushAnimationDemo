//
//  UINavigationController+PushAnimation.m
//  JYItem
//
//  Created by Dely on 16/2/24.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "UINavigationController+PushAnimation.h"
#import <objc/runtime.h>

static NSString *subtypeKey = @"subtypeKey";

@implementation UINavigationController (PushAnimation)

#pragma mark -set get方法
//push类型set get方法
- (void)setPushAnimationType:(PushType)pushAnimationType{
    
    SEL  key = @selector(pushAnimationType);
    objc_setAssociatedObject(self, key, @(pushAnimationType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (PushType)pushAnimationType{
    return [objc_getAssociatedObject(self,  _cmd) integerValue];
}

//push方向set get方法
- (void)setAnimationSubtype:(NSString *)animationSubtype{
    
    objc_setAssociatedObject(self, &subtypeKey, animationSubtype, OBJC_ASSOCIATION_COPY);
}

- (NSString *)animationSubtype{
    return objc_getAssociatedObject(self, &subtypeKey);
}


- (void)pushAnmiationViewController:(UIViewController *)viewController{
    
    if (self.pushAnimationType == PushDefault) {
        [self pushViewController:viewController animated:YES];
        
    }else if (self.pushAnimationType < 5){
        //UIView Animation
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.6];
        [self.navigationController pushViewController:viewController animated:NO];
        
        switch (self.pushAnimationType) {
            case PushCurlUp:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
                break;
            case PushCurlDown:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
                break;
            case PushFilpFromLeft:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
                break;
            case PushFilpFromRight:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
                break;
            default:
                break;
        }
        
        [UIView commitAnimations];
        //复原默认push
        self.pushAnimationType = PushDefault;
    } else {
        
        //core animation
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = 0.6;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        
        switch (self.pushAnimationType) {
            case PushFade:
                animation.type = kCATransitionFade;
                break;
            case PushMoveIn:
                animation.type = kCATransitionMoveIn;
                break;
            case PushReveal:
                animation.type = kCATransitionReveal;
                break;
            case PushPush:
                animation.type = kCATransitionPush;
                break;
            case PushCube:
                animation.type = @"cube";
                break;
            case PushPageCurl:
                animation.type = @"pageCurl";
                break;
            case PushPageUnCurl:
                animation.type = @"pageUnCurl";
                break;
            case PushSuckEffect:
                animation.type = @"suckEffect";
                break;
            case PushRippleEffect:
                animation.type = @"rippleEffect";
                break;
                
            default:
                break;
        }
        
        if (self.animationSubtype) {
            animation.subtype = self.animationSubtype;
        }else{
            animation.subtype = kCATransitionFromRight;
        }

        [self pushViewController:viewController animated:NO];
        [[self.view layer] addAnimation:animation forKey:@"animation"];
        //复原默认push
        self.pushAnimationType = PushDefault;
    }
    
}


@end
