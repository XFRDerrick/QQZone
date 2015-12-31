//
//  HTFMainSubViewController.m
//  kk
//
//  Created by 赫腾飞 on 16/1/1.
//  Copyright © 2016年 hetefe. All rights reserved.
//

#import "HTFMainSubViewController.h"

@interface HTFMainSubViewController ()

@end

@implementation HTFMainSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.view.window.rootViewController = sb.instantiateInitialViewController;

}

@end
