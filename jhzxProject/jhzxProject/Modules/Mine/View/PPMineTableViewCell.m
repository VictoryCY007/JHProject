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
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
