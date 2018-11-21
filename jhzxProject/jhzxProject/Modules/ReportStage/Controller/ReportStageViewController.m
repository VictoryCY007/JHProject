//
//  ReportStageViewController.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/19.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "ReportStageViewController.h"

@interface ReportStageViewController ()

@end

@implementation ReportStageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavi];
    [self setupUI];
}

- (void)setupNavi{
    [self addNavigationItemWithTitles:@[@"分享"] isLeft:YES target:self action:@selector(naviBtnClick:) tags:@[@1000]];

    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 80, 30);
    [btn setTitle:@"我要爆料" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(naviBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = SYSTEMFONT(16);
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];

    [btn setTitleColor:YYMainThemeColor forState:UIControlStateNormal];

    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)setupUI{
    [self.view setBackgroundColor:YYMainBackGroudColor];
    
}

-(void)naviBtnClick:(UIButton *)btn{

}


@end
