//
//  HTFIconBtn.m
//  kk
//
//  Created by 赫腾飞 on 15/12/31.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "HTFIconBtn.h"

#import "UIView+CZ.h"
@implementation HTFIconBtn

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        //设置图片和文字
        
        [self setImage:[UIImage imageNamed:@"login_default_avatar"] forState:UIControlStateNormal];
        [self setTitle:@"Baby" forState:UIControlStateNormal];
    }
    
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{

    if ( self.superview.width == BottomBtnWidth) {
        //竖屏
        
        return CGRectMake(0, 0, -1, -1);
    }else{
    
        return CGRectMake(0, self.width * 0.5 , self.width, self.height);
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    if (self.superview.width == BottomBtnWidth) {
        return self.bounds;
    }else{
        return CGRectMake(0, 0, self.width, self.width);
    
    }
    

}


@end
