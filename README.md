
    引入UINavigationController+PushAnimation.h文件
    NextViewController *vc = [[NextViewController alloc]init];
    
    //pushType 默认为PushDefault animationSubtype默认为kCATransitionFromRight ，可以不设置
    self.navigationController.pushAnimationType = PushDefault;
    self.navigationController.animationSubtype = kCATransitionFromRight;
    
    调用pushAnmiationViewController方法即可
    [self.navigationController pushAnmiationViewController:vc];
