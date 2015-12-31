//
//  ViewController.m
//  kk
//
//  Created by 赫腾飞 on 15/12/29.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "HTFMainViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *remberPassBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController
- (IBAction)remberPassBtn:(UIButton *)sender {
    
   //对按钮状态进行取反
    sender.selected = !sender.selected;
    
    if (!sender.selected) {
        //设置自动登录一定为未选中状态
        self.autoLoginBtn.selected = NO;
    }
    
    
    
}
- (IBAction)autoLoginBtn:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.remberPassBtn.selected = YES;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    if (textField == self.accountTextField) {
        [self.passWordTextField becomeFirstResponder];
    }else{
        
        [self loginBtn:nil];
        [textField endEditing:YES];
    }
    
    return YES;
}


- (IBAction)loginBtn:(UIButton *)sender {
    
    NSLog(@"loginBtn Did  Click ");
    
    //判断账号和密码
    if (self.accountTextField.text.length == 0 || self.passWordTextField.text.length == 0) {
        
        [SVProgressHUD showErrorWithStatus:@"账号密码为空" maskType:SVProgressHUDMaskTypeBlack];
        
    }else{
        
        [SVProgressHUD showSuccessWithStatus:@"正在登录……"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          
            //判断密码是否正确
            if ([self.accountTextField.text isEqualToString:@"123445689"] && [self.passWordTextField.text isEqualToString:@"987654321"]) {
                //输入正确 登录成功
                HTFMainViewController *mainVC = [[HTFMainViewController alloc] init];
               
                self.view.window.rootViewController = mainVC;
                
                
            }else{
                
                [SVProgressHUD showErrorWithStatus:@"账号或者密码错误\n请重新登录" maskType:SVProgressHUDMaskTypeClear];
                
                [self addAnimated];
            }
        });
    }
}


- (void)addAnimated
{
    //添加帧动画
    //设置属性
    CAKeyframeAnimation *ani = [[CAKeyframeAnimation alloc]init];
    ani.keyPath = @"transform.translation.x";
    ani.duration = 0.25;
    ani.repeatCount = 2;
    ani.values = @[@(-30),@(0),@(30),@(0)];
    
    [self.contentView.layer addAnimation:ani forKey:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
