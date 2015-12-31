//
//  HTFTabbarVIew.m
//  kk
//
//  Created by 赫腾飞 on 15/12/30.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "HTFTabbarVIew.h"

#import "UIView+CZ.h"
#import "HTFButton.h"

@interface HTFTabbarVIew ()

#pragma mark
@property (nonatomic, weak) HTFButton *btn;
@end

@implementation HTFTabbarVIew

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{

    [self addBtnAndImageName:@"tab_bar_e_album_icon" andTitle:@"邮件"];
    [self addBtnAndImageName:@"tab_bar_feed_icon" andTitle:@"空间"];
    [self addBtnAndImageName:@"tab_bar_friend_icon" andTitle:@"好友"];
    [self addBtnAndImageName:@"tab_bar_passive_feed_icon" andTitle:@"与我有关"];
    [self addBtnAndImageName:@"tab_bar_pic_wall_icon" andTitle:@"图片"];
    [self addBtnAndImageName:@"tab_bar_e_more_icon" andTitle:@"更多"];

}

- (void)addBtnAndImageName:(NSString *)imageName andTitle:(NSString *)title{
    
    HTFButton *btn = [HTFButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    
    //绑定tag
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.tag = self.subviews.count;
    
    [self addSubview:btn];

}

- (void)btnClick:(HTFButton *)btn{
    
    //判断当前按钮的状态
    self.btn.selected = NO;
    
    //更改更改状态
    //发送通知
    NSDictionary *dict = @{@"from": @(self.btn.tag),@"to": @(btn.tag)};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeView" object:nil userInfo:dict];

    btn.selected = YES;
    self.btn = btn;

}

- (void)setIsLandscape:(BOOL)isLandscape{
    
    _isLandscape = isLandscape;
    
    for (int i= 0; i<self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(0, i * BottomBtnHeight, self.width, BottomBtnHeight);
    }
    
    

}



@end
