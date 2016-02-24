//
//  ViewController.m
//  JYPushAnimationDemo
//
//  Created by Dely on 16/2/24.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+PushAnimation.h"
#import "NextViewController.h"


#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NextViewController *vc = [[NextViewController alloc]init];
    
    //1.引入#import "UINavigationController+PushAnimation.h"分类
    //2.pushType 默认为PushDefault animationSubtype默认为kCATransitionFromRight ,可以不设置，如果设置就会有效果
    
    self.navigationController.pushAnimationType = PushDefault;
    self.navigationController.animationSubtype = kCATransitionFromRight;
    
    self.navigationController.pushAnimationType = indexPath.row;
    [self.navigationController pushAnmiationViewController:vc];

    
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithArray:@[@"PushDefault",@"PushCurlUp",@"PushCurlDown",@"PushFilpFromLeft",@"PushFilpFromRight",@"PushFade",@"PushMoveIn",@"PushReveal",@"PushPush",@"PushCube",@"PushPageCurl",@"PushPageUnCurl",@"PushRippleEffect",@"PushSuckEffect"]];
    }
    return _dataSource;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
