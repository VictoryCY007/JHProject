//
//  MineViewController.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/19.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "MineViewController.h"
#import "PPMineTableViewCell.h"
#import "PPMineCenterBtn.h"
#import "PPMyPointViewController.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *iconImagV;

@property (nonatomic, strong) UILabel *nickNameLabel;

@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, copy) NSArray *iconImagvArray;

@property (nonatomic, copy) NSArray *iconTitleArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isHidenNaviBar = YES;
    self.StatusBarStyle = UIStatusBarStyleLightContent;
    _iconImagvArray = @[@"mine_enter_icon",@"mine_cooperation_icon",@"mine_about_icon",@"mine_guider_icon",@"mine_logout_icon"];
    
    _iconTitleArray = @[@"我要入驻",@"商务合作",@"关于我们",@"用户指南",@"退出登录"];

    [self setupUI];
}

- (void)setupUI{
    [self.view setBackgroundColor:YYMainBackGroudColor];
    
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 190 + statusBarHeight + 80 + 15)];
    containerView.backgroundColor = YYMainBackGroudColor;
    
    UIView *topView = [UIView new];
    topView.frame = CGRectMake(0, 0, KScreenWidth, 190 + statusBarHeight);
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = topView.frame;  // 设置显示的frame
    gradientLayer.colors = @[(id)[UIColor colorWithHexString:@"00A5FF"].CGColor,(id)[UIColor colorWithHexString:@"0072FF"].CGColor];  // 设置渐变颜色
    //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
    gradientLayer.startPoint = CGPointMake(0, 0);   //
    gradientLayer.endPoint = CGPointMake(1, 0);     //
    [topView.layer addSublayer:gradientLayer];

    [containerView addSubview:topView];
    
    
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
    
    
    
    
    
    UIImageView *modifyImagV = [UIImageView new];
    modifyImagV.image = IMAGE_NAMED(@"mine_modify_icon");
    
    
    [topView addSubview:modifyImagV];
    
    modifyImagV.sd_layout.heightIs(15)
    .widthIs(15).leftSpaceToView(_iconImagV, 10).topSpaceToView(leftBtn, 69);
    
    
    _nickNameLabel = [UILabel new];
    _nickNameLabel.font = BOLDSYSTEMFONT(18);
    _nickNameLabel.textColor = KWhiteColor;
    _nickNameLabel.text = @"点击设置昵称";
    
    [topView addSubview:_nickNameLabel];

    _nickNameLabel.sd_layout.bottomEqualToView(modifyImagV).leftSpaceToView(modifyImagV, 5).heightIs(20);
    [_nickNameLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    _phoneLabel = [UILabel new];
    _phoneLabel.font = [UIFont systemFontOfSize:14.f weight:UIFontWeightMedium];
    _phoneLabel.textColor = KWhiteColor;
    _phoneLabel.text = @"15274893099";
    
    [topView addSubview:_phoneLabel];
    
    _phoneLabel.sd_layout.leftEqualToView(modifyImagV)
    .heightIs(20).topSpaceToView(_nickNameLabel, 5);
    [_phoneLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    UIButton *signBtn = [UIButton new];
    signBtn.backgroundColor = KWhiteColor;
    signBtn.sd_cornerRadius = @(15);
    
    [topView addSubview:signBtn];
    
    signBtn.sd_layout.heightIs(30).widthIs(100)
    .rightSpaceToView(topView, -10).centerYEqualToView(_iconImagV);
    
    
    UIImageView *signImagV = [UIImageView new];
    signImagV.image = IMAGE_NAMED(@"mine_signed_icon");
    
    
    [signBtn addSubview:signImagV];
    
    signImagV.sd_layout.heightIs(15).widthIs(15).centerYEqualToView(signBtn)
    .leftSpaceToView(signBtn, 12);
    
    UILabel *signedLabel = [UILabel new];
    signedLabel.font = [UIFont systemFontOfSize:12.f weight:UIFontWeightMedium];
    signedLabel.textColor = YYMainThemeColor;
    signedLabel.text = @"签到+30";
    
    [signBtn addSubview:signedLabel];
    
    signedLabel.sd_layout.heightIs(15).centerYEqualToView(signBtn)
    .leftSpaceToView(signImagV, 4);
    
    [signedLabel setSingleLineAutoResizeWithMaxWidth:signBtn.width - 40];
    
    ///
    UIView *centerView = [UIView new];
    centerView.backgroundColor = KWhiteColor;
    
    
    [containerView addSubview:centerView];

    centerView.sd_layout.heightIs(80)
    .widthIs(KScreenWidth).leftEqualToView(topView).topSpaceToView(topView, 0);
    
  //
    PPMineCenterBtn *pointClickBtn = [PPMineCenterBtn new];
    pointClickBtn.numberLabel.textColor = [UIColor colorWithHexString:@"FF4500"];
    pointClickBtn.numberLabel.text = @"999";
    pointClickBtn.desclLabel.text = @"我的积分";
    [pointClickBtn addTapBlock:^(UIButton *btn) {
        PPMyPointViewController *Vc = [PPMyPointViewController new];
        [self.navigationController pushViewController:Vc animated:YES];
    }];
    [centerView addSubview:pointClickBtn];
    
    pointClickBtn.sd_layout.heightIs(centerView.height)
    .leftSpaceToView(centerView, 0).topSpaceToView(centerView, 0)
    .widthIs(centerView.width/3);
    
    PPMineCenterBtn *collectClickBtn = [PPMineCenterBtn new];
    collectClickBtn.numberLabel.textColor = [UIColor colorWithHexString:@"FFB400"];
    collectClickBtn.numberLabel.text = @"999";
    collectClickBtn.desclLabel.text = @"我的收藏";
    [centerView addSubview:collectClickBtn];
    
    collectClickBtn.sd_layout.heightIs(centerView.height)
    .leftSpaceToView(pointClickBtn, 0).topSpaceToView(centerView, 0)
    .widthIs(centerView.width/3);
    
    PPMineCenterBtn *followClickBtn = [PPMineCenterBtn new];
    followClickBtn.numberLabel.textColor = [UIColor colorWithHexString:@"0072FF"];
    followClickBtn.numberLabel.text = @"999";
    followClickBtn.desclLabel.text = @"我的关注";
    [centerView addSubview:followClickBtn];
    
    followClickBtn.sd_layout.heightIs(centerView.height)
    .leftSpaceToView(collectClickBtn, 0).topSpaceToView(centerView, 0)
    .widthIs(centerView.width/3);
    
    
    self.tableView.height = KScreenHeight - kTabBarHeight;
    self.tableView.backgroundColor = YYMainBackGroudColor;
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
    self.tableView.rowHeight = 55;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = containerView;


    [self.view addSubview:self.tableView];

}



#pragma mark ————— tableview 代理 —————
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = @"PPMineTableViewCell";
    
    PPMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[PPMineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.backgroundColor = KWhiteColor;
    cell.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30);
    
    cell.iconImagV.image = IMAGE_NAMED(_iconImagvArray[indexPath.row]);
    
    cell.selectLabel.text = _iconTitleArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    //////////////////////////////////////////////////////////////////////
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}


@end
