//
//  LoginViewController.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/20.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()

@property (nonatomic, strong) UITextField *phoneInputText;

@property (nonatomic, strong) UITextField *codeInputText;

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
    [closeBtn addTarget:self action:@selector(closeAction:)forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:closeBtn];
    
    closeBtn.sd_layout.heightIs(20).widthIs(20).leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view, statusBarHeight + 12);
    
}


- (void)closeAction:(UIButton *)sender{
     [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupUI{
    
    UIImageView *logoImagV = [UIImageView new];
    logoImagV.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:logoImagV];
    
    logoImagV.sd_layout.heightIs(80).widthIs(80)
    .centerXEqualToView(self.view).topSpaceToView(self.view, statusBarHeight + 75);
    
    UILabel *appNameLabel = [UILabel new];
    appNameLabel.font = BOLDSYSTEMFONT(18);
    appNameLabel.textColor = YYNavigateTitleColor;
    appNameLabel.text = @"江湖在线";
    
    [self.view addSubview:appNameLabel];
    
    appNameLabel.sd_layout.heightIs(18)
    .centerXEqualToView(logoImagV).topSpaceToView(logoImagV, 15);
    [appNameLabel setSingleLineAutoResizeWithMaxWidth:150];
    
    
    
    
    UIView *inputView = [UIView new];
    inputView.backgroundColor = YYMainBackGroudColor;
    inputView.sd_cornerRadius = @(4);
    
    [self.view addSubview:inputView];
    
    inputView.sd_layout.heightIs(180).widthIs(345)
    .centerXEqualToView(appNameLabel).topSpaceToView(appNameLabel, 54);
    
    UILabel *phoneLabel = [UILabel new];
    phoneLabel.font = BOLDSYSTEMFONT(14);
    phoneLabel.text = @"手机号";
    
    [inputView addSubview:phoneLabel];
    
    phoneLabel.sd_layout.heightIs(15)
    .leftSpaceToView(inputView, 15).topSpaceToView(inputView, 29);
    
    [phoneLabel setSingleLineAutoResizeWithMaxWidth:50];
    
    _phoneInputText = [UITextField new];
    _phoneInputText.font = SYSTEMFONT(12);
    _phoneInputText.textColor = YYNavigateTitleColor;
    _phoneInputText.keyboardType = UIKeyboardTypeNumberPad;
    _phoneInputText.placeholder = @"请填写真实有效的11位数手机号码";
    _phoneInputText.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [inputView addSubview:_phoneInputText];

    _phoneInputText.sd_layout.heightIs(40)
    .leftSpaceToView(phoneLabel, 25).rightSpaceToView(inputView, 30).centerYEqualToView(phoneLabel);
    
    UILabel *codeLabel = [UILabel new];
    codeLabel.font = BOLDSYSTEMFONT(14);
    codeLabel.text = @"验证码";
    
    [inputView addSubview:codeLabel];
    
    codeLabel.sd_layout.heightIs(15)
    .leftEqualToView(phoneLabel).topSpaceToView(phoneLabel, 57);
    
    [codeLabel setSingleLineAutoResizeWithMaxWidth:50];
    
    
    _codeInputText = [UITextField new];
    _codeInputText.font = SYSTEMFONT(12);
    _codeInputText.textColor = YYNavigateTitleColor;
    _codeInputText.keyboardType = UIKeyboardTypeNumberPad;
    _codeInputText.placeholder = @"请输入手机号收到的验证码";
    _codeInputText.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [inputView addSubview:_codeInputText];
    
    _codeInputText.sd_layout.heightIs(40)
    .leftSpaceToView(codeLabel, 25).rightSpaceToView(inputView, 100).centerYEqualToView(codeLabel);
    
    
    
    UILabel *descLabel = [UILabel new];
    descLabel.font = SYSTEMFONT(12);
    descLabel.text = @"登录注册一体化，新用户无需注册，可凭手机号直接登录";
    descLabel.textColor = [UIColor colorWithHexString:@"A3B4CE"];
    
    [inputView addSubview:descLabel];
    
    descLabel.sd_layout.heightIs(12)
    .centerXEqualToView(inputView).topSpaceToView(codeLabel, 40);
    
    [descLabel setSingleLineAutoResizeWithMaxWidth:inputView.width];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setBackgroundColor:[UIColor colorWithHexString:@"BBC7D6"] forState:UIControlStateDisabled];
    [loginBtn setBackgroundColor:[UIColor colorWithHexString:@"0072FF"] forState:UIControlStateNormal];
    [loginBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];

    loginBtn.titleLabel.font = SYSTEMFONT(16);
    loginBtn.sd_cornerRadius = @(25);
    
    [self.view addSubview:loginBtn];
    
    
    loginBtn.sd_layout.heightIs(50).widthIs(315)
    .centerXEqualToView(self.view).topSpaceToView(inputView, 30);
    
    
    loginBtn.enabled = NO;
    
    

    
    
    NSString *agreementText = @"登录即代表您已阅读并同意《江湖在线用户注册协议》";
    

    NSMutableAttributedString *text  = [[NSMutableAttributedString alloc] initWithString: agreementText];
    text.font = SYSTEMFONT(12);
    text.alignment = NSTextAlignmentCenter;
    text.color = [UIColor colorWithHexString:@"566F8E"];
    [text setTextHighlightRange:NSMakeRange(agreementText.length - 12,12) color:YYMainThemeColor backgroundColor:KWhiteColor tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        
        RootViewController *vc = [RootViewController new];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    YYLabel *protocalLabel = [YYLabel new];
    protocalLabel.frame = CGRectMake(KScreenWidth/2 - 315/2,550,315,15);
    protocalLabel.numberOfLines = 1;
    protocalLabel.attributedText = text;

    [self.view addSubview:protocalLabel];


}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
