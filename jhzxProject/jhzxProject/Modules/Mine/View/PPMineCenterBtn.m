//
//  PPMineCenterBtn.m
//  jhzxProject
//
//  Created by 权威 on 2018/11/22.
//  Copyright © 2018年 Smith Tylor. All rights reserved.
//

#import "PPMineCenterBtn.h"

@implementation PPMineCenterBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(UILabel *)numberLabel{
    if (!_numberLabel) {
        _numberLabel = [UILabel new];
        _numberLabel.textColor = [UIColor colorWithHexString:@"FF4500"];
        _numberLabel.font = BOLDSYSTEMFONT(16);
        
        [self addSubview:_numberLabel];
        
        _numberLabel.sd_layout.heightIs(16)
        .centerXEqualToView(self)
        .topSpaceToView(self, 23);
        
        [_numberLabel setSingleLineAutoResizeWithMaxWidth:self.width];
    }
    
    return  _numberLabel;
}

-(UILabel *)desclLabel{
    if (!_desclLabel) {
        _desclLabel = [UILabel new];
        _desclLabel.textColor = [UIColor colorWithHexString:@"999999"];
        _desclLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        
        [self addSubview:_desclLabel];
        
        _desclLabel.sd_layout.heightIs(16)
        .centerXEqualToView(self)
        .topSpaceToView(_numberLabel, 10);
        
        [_desclLabel setSingleLineAutoResizeWithMaxWidth:self.width];
    }
    
    return  _desclLabel;
}

@end
