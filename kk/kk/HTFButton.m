//
//  HTFButton.m
//  kk
//
//  Created by 赫腾飞 on 15/12/30.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "HTFButton.h"
#import "UIView+CZ.h"
@implementation HTFButton


- (void)layoutSubviews{

    [super layoutSubviews];
    if (self.superview.width == BottomBtnWidth) {
        //是竖屏
        CGSize size = self.bounds.size;

        self.imageView.center = CGPointMake(size.width * 0.5, size.height * 0.5);
        self.titleLabel.frame = CGRectMake(0, 0, 0, 0);
        
    }else{
    
        //横屏
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
        
    }
    
}

@end
