//
//  HWBaseCell.m
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import "HWBaseCell.h"
#import "HWBaseModel.h"
#define kLabelFont [UIFont systemFontOfSize:15]
@interface HWBaseCell ()

/**
 *  图片
 */
@property (weak, nonatomic) UIImageView *iconImageView;

/**
 *  标题
 */
@property (weak, nonatomic) UILabel *titleLabel;

/**
 *  发表时间
 */
@property (weak, nonatomic) UILabel *timeLabel;

/**
 *  商品店家名称
 */
@property (weak, nonatomic) UILabel *nameLabel;

@end

@implementation HWBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 创建子控件
        [self setupSubViews];
        
        // 设置子控件的布局
        [self setupSubViewsLayout];
    }
    
    return self;
}

#pragma mark - 创建子控件
- (void) setupSubViews {
    
    // 图片
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFont:kLabelFont];
    titleLabel.numberOfLines = 0;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    // 发布时间
    UILabel *timeLabel = [[UILabel alloc] init];
    [timeLabel setFont:kLabelFont];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    // 商家名称
    UILabel *nameLabel = [[UILabel alloc] init];
    [nameLabel setFont:kLabelFont];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
}

#pragma mark - 设置子控件的布局
- (void) setupSubViewsLayout {
    
    __weak typeof(self) weakSelf = self;
    
    int margin = 10;
    
    // 图片设置约束
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(margin);
        make.top.offset(margin);
        make.bottom.offset(-margin);
        make.width.and.height.mas_equalTo(@110);
    }];
    
    // 标题设置约束
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.iconImageView.mas_right).offset(margin);
        make.top.equalTo(weakSelf.iconImageView.mas_top);
        make.right.offset(-margin);
    }];
    
    // 发布时间设置约束
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLabel.mas_left);
        make.bottom.equalTo(weakSelf.iconImageView.mas_bottom);
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(margin);
    }];
    
    // 商家名称设置约束
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.timeLabel.mas_top);
        make.right.equalTo(weakSelf.titleLabel.mas_right);
        make.bottom.equalTo(weakSelf.timeLabel.mas_bottom);
    }];


}

#pragma mark - 给控件属性赋值
- (void)setBaseModel:(HWBaseModel *)baseModel {
    
    _baseModel = baseModel;
    
    NSString *imageName = [NSString stringWithFormat:@"http://www.zhiribao.com/upload/%@",baseModel.image];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"nophoto"]];
    [self.titleLabel setText:baseModel.title];
    [self.timeLabel setText:baseModel.created_at];
    [self.nameLabel setText:baseModel.name];
}

@end
