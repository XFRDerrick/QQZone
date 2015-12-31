//
//  HTFDockView.m
//  kk
//
//  Created by 赫腾飞 on 15/12/30.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "HTFDockView.h"
#import "HTFBottomView.h"
#import "UIView+CZ.h"
#import "HTFTabbarVIew.h"
#import "HTFIconBtn.h"

@interface HTFDockView ()

#pragma mark 底部视图
@property (nonatomic, weak) HTFBottomView *bottomView;
@property (nonatomic, weak) HTFTabbarVIew *tabbarView;
@property (nonatomic, weak) HTFIconBtn *iconView;

@end


@implementation HTFDockView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //添加子视图
        
        [self addSubviews];
    }
    return self;

}

- (void)addSubviews{
    
    if (self.isLandscape) {
        
    }
    HTFBottomView *bottom = [[HTFBottomView alloc] init];
    
    bottom.backgroundColor = [UIColor redColor];
    self.bottomView = bottom;
    [self addSubview:bottom];
    
    
    HTFTabbarVIew *tabbarView = [[HTFTabbarVIew alloc] init];
    
    tabbarView.backgroundColor = [UIColor orangeColor];
    [self addSubview:tabbarView];
    self.tabbarView = tabbarView;
    
    
    HTFIconBtn *iconView = [[HTFIconBtn alloc] init];
    
    iconView.backgroundColor = [UIColor blackColor];
    [self addSubview:iconView];
    self.iconView = iconView;
    
}

- (void)setIsLandscape:(BOOL)isLandscape{
    
    _isLandscape = isLandscape;
    
    //设置横竖屏对应的bottomView的frame
    
    if (isLandscape) {
        self.bottomView.frame = CGRectMake(0, self.height - self.bottomView.subviews.count * BottomBtnHeight, BottomBtnWidth, self.bottomView.subviews.count * BottomBtnHeight);
        
    }else{
        self.bottomView.frame = CGRectMake(0, self.height - BottomBtnHeight, self.bottomView.subviews.count * BottomBtnWidth, BottomBtnHeight);
    }
    
    self.bottomView.isLandscape = isLandscape;
    
    //设置TabbarVIew的frame
    self.tabbarView.frame = CGRectMake(0, self.height - self.bottomView.height - self.tabbarView.subviews.count * BottomBtnHeight, self.bottomView.width, self.tabbarView.subviews.count * BottomBtnHeight);
    self.tabbarView.isLandscape = isLandscape;
    
    
    if (isLandscape) {
        //竖屏
        CGFloat gap = 10;
        
        //竖屏时 frame.y 设定
        CGFloat Y = (self.height - self.bottomView.height - self.tabbarView.height - (self.bottomView.width - 2 * gap)) * 0.5;
        
        self.iconView.frame = CGRectMake(gap, Y, self.bottomView.width - 2 * gap, self.bottomView.width - 2 * gap);
        
    }else{
    
        
        CGFloat iconW = 100;
        CGFloat iconH = 100;
        CGFloat titleH = iconH * 0.3;
        
        self.iconView.frame = CGRectMake((self.bottomView.width - iconW ) * 0.5, 30, iconW, iconH  + titleH);
    }
    
    
    
}




@end
