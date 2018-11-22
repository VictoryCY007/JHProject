//
//  PPMineTableViewCell.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/22.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "PPMineTableViewCell.h"

@implementation PPMineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}



- (void)setupUI{
    
    self.contentView.backgroundColor = YYMainBackGroudColor;
    
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, KScreenWidth - 30, 55)];
    containerView.backgroundColor = KWhiteColor;
    [self.contentView addSubview:containerView];
    
    
    _iconImagV = [UIImageView new];
    _iconImagV.image = IMAGE_NAMED(@"mine_enter_icon");
    
    
    [containerView addSubview:_iconImagV];
    
    _iconImagV.sd_layout.heightIs(22).widthIs(22)
    .leftSpaceToView(containerView, 15).topSpaceToView(containerView, 33/2);
    
    _selectLabel = [UILabel new];
    _selectLabel.textColor = YYNavigateTitleColor;
    _selectLabel.font = BOLDSYSTEMFONT(13);
//    _selectLabel.text = @"我要入驻";
    
    [containerView addSubview:_selectLabel];
    
    _selectLabel.sd_layout.heightIs(20)
    .leftSpaceToView(_iconImagV, 13).centerYEqualToView(_iconImagV);
    
    [_selectLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    UIImageView *rightArrow = [UIImageView new];
//    rightArrow.image = IMAGE_NAMED(@"mine_arrow_icon");
    
    
    [containerView addSubview:rightArrow];
    
    rightArrow.sd_layout.heightIs(8).widthIs(8)
    .rightSpaceToView(containerView, 15)
    .topSpaceToView(containerView, 47/2);
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
