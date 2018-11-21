//
//  MineViewController.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/19.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *iconImagV;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isHidenNaviBar = YES;
    self.StatusBarStyle = UIStatusBarStyleLightContent;

    [self setupUI];
}

- (void)setupUI{
    [self.view setBackgroundColor:YYMainBackGroudColor];
    
    UIView *topView = [UIView new];
    topView.frame = CGRectMake(0, 0, KScreenWidth, 190 + statusBarHeight);
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = topView.frame;  // 设置显示的frame
    gradientLayer.colors = @[(id)[UIColor colorWithHexString:@"00A5FF"].CGColor,(id)[UIColor colorWithHexString:@"0072FF"].CGColor];  // 设置渐变颜色
    //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
    gradientLayer.startPoint = CGPointMake(0, 0);   //
    gradientLayer.endPoint = CGPointMake(1, 0);     //
    [topView.layer addSublayer:gradientLayer];

    [self.view addSubview:topView];
    
    
    UIButton *leftBtn = [UIButton new];
    [leftBtn setTitle:@"我的" forState:UIControlStateNormal];
    [leftBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
    leftBtn.titleLabel.font = BOLDSYSTEMFONT(18);
    
    [topView addSubview:leftBtn];
    
    leftBtn.sd_layout.heightIs(20)
    .leftSpaceToView(topView, 16)
    .topSpaceToView(topView, 10 + statusBarHeight);
    
    [leftBtn setupAutoSizeWithHorizontalPadding:2 buttonHeight:25];
    
    UIButton *rightBtn =  [UIButton new];
    [rightBtn setImage:IMAGE_NAMED(@"mine_share_icon") forState:UIControlStateNormal];
    
    [topView addSubview:rightBtn];
    
    rightBtn.sd_layout.heightIs(20)
    .widthIs(25)
    .rightSpaceToView(topView, 16)
    .topSpaceToView(topView, 10 + statusBarHeight);
    
    
    _iconImagV = [UIImageView new];
    _iconImagV.image = IMAGE_NAMED(@"mine_head_icon");
    
    [topView addSubview:_iconImagV];
    
    
    _iconImagV.sd_layout.heightIs(63)
    .widthIs(63).leftEqualToView(leftBtn).topSpaceToView(leftBtn, 55);
    
    
    ///
    UIView *centerView = [UIView new];
    centerView.backgroundColor = KWhiteColor;
    
    
    [self.view addSubview:centerView];

    centerView.sd_layout.heightIs(80)
    .widthIs(KScreenWidth).leftEqualToView(topView).topSpaceToView(topView, 0);
    
    
    
    self.tableView.height = KScreenHeight - kTabBarHeight;
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


@end
