//
//  LoginViewController.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/20.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavi];
    [self setupUI];
}
- (void)setupNavi{
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:IMAGE_NAMED(@"login_close_icon") forState:UIControlStateNormal];
    
    [self.view addSubview:closeBtn];
    
    closeBtn.sd_layout.heightIs(40).widthIs(40).leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view, 20);
    
}

- (void)setupUI{
    
}

@end
