//
//  PPMyPointViewController.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/22.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "PPMyPointViewController.h"

@interface PPMyPointViewController ()

@end

@implementation PPMyPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isHidenNaviBar = YES;
    self.StatusBarStyle = UIStatusBarStyleLightContent;
    
    [self setupUI];
    
}

- (void)setupUI{

    
    UIImageView *topBackView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, statusBarHeight + 240)];
    topBackView.image = IMAGE_NAMED(@"mine_point_topback");
    
    [self.view addSubview:topBackView];
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(12, kStatusBarHeight+12, 20, 20);
    [backBtn setImage:IMAGE_NAMED(@"back_icon-1") forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
