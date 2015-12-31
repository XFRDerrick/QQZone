//
//  HTFMainViewController.m
//  kk
//
//  Created by 赫腾飞 on 15/12/30.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "HTFMainViewController.h"

#import "HTFDockView.h"

#import "UIView+CZ.h"
#import "HTFMainSubViewController.h"

@interface HTFMainViewController ()

@property (nonatomic, weak) HTFDockView *dockView;

@property (nonatomic,weak )UIView *contentView ;
@end

@implementation HTFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self addSubViews];
    [self viewWillTransitionToSize:[UIScreen mainScreen].bounds.size withTransitionCoordinator:nil];
    
    //添加自控制器
    [self addChildViewControllers];
    
    //接受通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeView:) name:@"changeView" object:nil];
    
}

- (void)addSubViews{
    
    HTFDockView *dockView = [[HTFDockView alloc] init];
    
    dockView.backgroundColor = [UIColor darkGrayColor];
    
    dockView.frame = CGRectMake(0, 0, 240, self.view.height);
//    设置高度自动拉伸
    dockView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    self.dockView = dockView;
    [self.view addSubview:dockView];
    
    
    //添加contentView
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:contentView];
    
    self.contentView = contentView;

}

#pragma mark 旋转屏幕会调用 此 方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
   
    self.dockView.height = size.height;
    
    if (size.width > size.height) {
        self.dockView.isLandscape = NO;
         self.dockView.frame = CGRectMake(0, 0, 240, [UIScreen mainScreen].bounds.size.height);
        
    }else{
        self.dockView.isLandscape = YES;
         self.dockView.frame = CGRectMake(0, 0, 80, [UIScreen mainScreen].bounds.size.height);
    }
    
    
    self.contentView.frame = CGRectMake(self.dockView.width, 0, 600, size.height);

}

- (void)addChildViewControllers{
    
    //创建添加控制器
    HTFMainSubViewController *vc = [[HTFMainSubViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithRed: arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
    for (int i =0 ; i< 5; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.view.backgroundColor = [UIColor colorWithRed: arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1];
        [self addChildViewController:nav];
    }
    


}

- (void)changeView:(NSNotification *)not{
    
    NSLog(@"%@",not);
    NSDictionary *dict = not.userInfo;
    
    //取出from
    NSInteger from = [dict[@"form"] integerValue];
    UINavigationController *fromVC = self.childViewControllers[from];
    
    [fromVC.view removeFromSuperview];
    
    //取出to
    NSInteger to = [dict[@"to"] integerValue];
    UINavigationController *vc = self.childViewControllers[to];
    vc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:vc.view];
    
    //添加转场动画
    CATransition *trans = [[CATransition alloc] init];
    
    trans.type = @"cube";
    
    trans.duration = 1.0;
    
    [self.contentView.layer addAnimation:trans forKey:nil];
    


}

@end
