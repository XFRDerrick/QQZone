//
//  HTFBottomView.m
//  kk
//
//  Created by 赫腾飞 on 15/12/30.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "HTFBottomView.h"

@implementation HTFBottomView


- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        //加载子视图
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{

    [self addBtnAndImageName:@"tabbar_blog"];
    [self addBtnAndImageName:@"tabbar_mood"];
    [self addBtnAndImageName:@"tabbar_photo"];
    
}

- (void)addBtnAndImageName:(NSString *)imageName{

    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateNormal];
    [self addSubview:btn];

}

- (void)setIsLandscape:(BOOL)isLandscape{
    
    _isLandscape = isLandscape;
    
    if (!isLandscape) {
        //横屏
        for ( int i = 0; i < self.subviews.count; i++) {
            UIButton *btn = self.subviews[i];
            btn.frame = CGRectMake(BottomBtnWidth * i, 0, BottomBtnWidth, BottomBtnHeight);
        }
    }else{
        
        for (int i =0 ; i < self.subviews.count; i++) {
            UIButton *btn = self.subviews[i];
            btn.frame = CGRectMake(0, BottomBtnHeight * i, BottomBtnWidth, BottomBtnHeight);
        }
        
    }

}


@end
