//
//  HomeViewController.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/19.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isShowLiftBack = NO;//每个根视图需要设置该属性为NO，否则会出现导航栏异常
    [self setupNavi];
    [self setupUI];
}


-(BOOL)isNeedTransition{
    return YES;
}

- (void)setupNavi{
//    [self addNavigationItemWithTitles:@[@"东莞"] isLeft:YES target:self action:@selector(naviBtnClick:) tags:@[@1000]];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 80, 30);
    [btn setTitle:@"东莞市" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(naviBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = SYSTEMFONT(14);
    [btn setTitleColor:YYMainThemeColor forState:UIControlStateNormal];
    [btn setImage:IMAGE_NAMED(@"home_city_arrow_icon") forState:UIControlStateNormal];
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.bounds.size.width - 5, 0, btn.imageView.bounds.size.width + 3);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width, 0, -btn.titleLabel.bounds.size.width);
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    
    //
    UIView *searchView = [UIView new];
    searchView.frame = CGRectMake(0, 0, KScreenWidth - 100, 34);
    searchView.backgroundColor = YYMainBackGroudColor;
    searchView.layer.cornerRadius = 5;
    searchView.clipsToBounds = YES;
    self.navigationItem.titleView = searchView;
    
    
    

}


- (void)setupUI{
    [self.view setBackgroundColor:YYMainBackGroudColor];
    
}


-(void)naviBtnClick:(UIButton *)btn{
    btn.userInteractionEnabled = NO;
    LoginViewController *vc = [LoginViewController new];
    vc.isHidenNaviBar = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    //GCD延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        btn.userInteractionEnabled = YES;

    });


}

@end
