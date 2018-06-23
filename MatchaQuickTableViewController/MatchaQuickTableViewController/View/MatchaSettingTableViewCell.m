//
//  MatchaSettingTableViewCell.m
//  MatchaQuickTableViewController
//
//  Created by 陈欢 on 2018/6/23.
//  Copyright © 2018年 Matcha00. All rights reserved.
//





#import "MatchaSettingTableViewCell.h"
#import "MatchaCellModel.h"
#import "UIView+CH.h"
//#import "MatchaConst.h"
@interface MatchaSettingTableViewCell()

@property (nonatomic, strong) UILabel *funcNameLabel;

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UISwitch *cellSwitch;

@property (nonatomic, strong) UILabel *detailLabel;


@property (nonatomic, strong) UIImageView *detailImageView;

@property (nonatomic,strong) UIImageView *indicator;

@property (nonatomic, strong) UIView *underlineView;

@end
@implementation MatchaSettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //SeparatorStyleNone
        
        
    }
    return self;
}

- (void)setModel:(MatchaCellModel *)model
{
    _model = model;
    
    [self setupDataUI];
}
- (void)setupDataUI
{
    if (self.model.img) {
        [self setupImgView];
    }
    
    if (self.model.funcName) {
        [self setupFuncLabel];
    }
    
    if (self.model.cellType) {
        [self setupCellType];
    }
    
    if (self.model.detailText) {
        [self setupDetailText];
    }
    
    if (self.model.detailImage) {
        [self setupDetailImage];
    }
    
    
//    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 1, MatchaScreenWidth, 1)];
//    line.backgroundColor = [UIColor redColor];//MatchaColorWithRGB(234, 234, 234, 1);
    [self.contentView addSubview:self.underlineView];
    
}


- (void)setupImgView
{
    [self.contentView addSubview:self.imgView];
}

- (void)setupFuncLabel
{
    [self.contentView addSubview:self.funcNameLabel];
}

- (void)setupCellType
{
    switch (self.model.cellType) {
        case CHCellTypeNone:
            break;
        case CHCellTypeDisclosureIndicator:
            [self setupIndicatorImage];
            break;
        case CHCellTypeSwitch:
            [self setupSwitch];
            break;
        default:
            break;
    }
}


- (void)setupDetailText
{
    [self.contentView addSubview:self.detailLabel];
}

- (void)setupDetailImage
{
    [self.contentView addSubview:self.detailImageView];
}

- (void)setupSwitch
{
    [self.contentView addSubview:self.cellSwitch];
}

- (void)setupIndicatorImage
{
    [self.contentView addSubview:self.indicator];
}

#pragma mark lazy

- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]initWithImage:self.model.img];
        _imgView.x = MatchaFuncImgToLeftGap;
        _imgView.centerY = self.contentView.centerY;
    }
    return _imgView;
}



- (UILabel *)funcNameLabel
{
    if (!_funcNameLabel) {
        _funcNameLabel = [[UILabel alloc]init];
        _funcNameLabel.text = self.model.funcName;
        _funcNameLabel.textColor = MatchaColorWithRGB(51, 51, 51, 1);
        _funcNameLabel.font = [UIFont systemFontOfSize:MatchaFuncLabelFont];
        _funcNameLabel.size = [self sizeForTitle:self.model.funcName withFont:_funcNameLabel.font];
        _funcNameLabel.centerY = self.contentView.centerY;
        _funcNameLabel.x = CGRectGetMaxX(self.imgView.frame) + MatchaFuncLabelToFuncImgGap;
        
    }
    
    return _funcNameLabel;
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
    
    return CGSizeMake(titleRect.size.width, titleRect.size.height);
}


- (UIImageView *)indicator
{
    if (!_indicator) {
        _indicator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_arrow"]];
        _indicator.centerY = self.contentView.centerY;
        _indicator.x = MatchaScreenWidth - _indicator.width - MatchaIndicatorToRightGap;
    }
    return _indicator;
}

- (UIView *)underlineView
{
    if (!_underlineView) {
        _underlineView = [[UIView alloc]init];
        _underlineView.backgroundColor = [UIColor redColor];//MatchaColorWithRGB(234, 234, 234, 1);
        
    }
    
    return _underlineView;
    
}


- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = self.model.funcName;
        _detailLabel.textColor = MatchaColorWithRGB(51, 51, 51, 1);
        _detailLabel.font = [UIFont systemFontOfSize:MatchaFuncLabelFont];
        _detailLabel.size = [self sizeForTitle:self.model.funcName withFont:_funcNameLabel.font];
        _detailLabel.centerY = self.contentView.centerY;
        
        switch (self.model.cellType) {
            case CHCellTypeNone:
                _detailLabel.x = MatchaScreenWidth - _detailLabel.width - MatchaDetailViewToIndicatorGap - 2;
                break;
            case CHCellTypeDisclosureIndicator:
                _detailLabel.x = self.indicator.x - _detailLabel.width - MatchaDetailViewToIndicatorGap;
                break;
            case CHCellTypeSwitch:
                 _detailLabel.x = self.cellSwitch.x - _detailLabel.width - MatchaDetailViewToIndicatorGap;
                break;
            default:
                break;
        }
        
        //_detailLabel.x = CGRectGetMaxX(self.imgView.frame) + MatchaFuncLabelToFuncImgGap;
        
    }
    
    return _detailLabel;
}

- (UIImageView *)detailImageView
{
    if (!_detailImageView) {
        _detailImageView = [[UIImageView alloc]initWithImage:self.model.detailImage];
        _detailImageView.centerY = self.contentView.centerY;
        
        switch (self.model.cellType) {
            case CHCellTypeNone:
                _detailImageView.x = MatchaScreenWidth - _detailLabel.width - MatchaDetailViewToIndicatorGap - 2;
                break;
            case CHCellTypeDisclosureIndicator:
                _detailImageView.x = self.indicator.x - _detailLabel.width - MatchaDetailViewToIndicatorGap;
                break;
            case CHCellTypeSwitch:
                _detailImageView.x = self.cellSwitch.x - _detailLabel.width - MatchaDetailViewToIndicatorGap;
                break;
            default:
                break;
        }
    }
    
    return _detailImageView;
}

- (UISwitch *)cellSwitch
{
    if (!_cellSwitch) {
        _cellSwitch = [[UISwitch alloc]init];
        _cellSwitch.centerY = self.contentView.centerY;
        _cellSwitch.x = MatchaScreenWidth - _cellSwitch.width - MatchaIndicatorToRightGap;
        [_cellSwitch addTarget:self action:@selector(switchTouch:) forControlEvents:UIControlEventValueChanged];
    }
    
    return  _cellSwitch;
}


- (void)switchTouch:(UISwitch *)sw
{
   // __weak typeof(self) weakSelf = self;
    
    if (self.model.switchChange) {
        self.model.switchChange(sw.isOn);
    }
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    switch (self.model.underlineX) {
        case CHUnderlineXWithNone:
            self.underlineView.frame = CGRectMake(0, self.height - 1, MatchaScreenWidth, 1);
            break;
        case CHUnderlineXWithImage:
            self.underlineView.frame = CGRectMake(self.imgView.x, self.height - 1, MatchaScreenWidth, 1);
            break;
        case CHUnderlineXWithLabel:
            self.underlineView.frame = CGRectMake(self.funcNameLabel.x, self.height - 1, MatchaScreenWidth, 1);
            break;
            
        default:
            break;
    }
    
    
}





@end
