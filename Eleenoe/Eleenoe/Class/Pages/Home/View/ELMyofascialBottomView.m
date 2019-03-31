//
//  ELMyofascialBottomView.m
//  Eleenoe
//
//  Created by HuiLu on 2019/3/30.
//  Copyright © 2019 FaceBook. All rights reserved.
//

#import "ELMyofascialBottomView.h"
#import "ELMyofascialMenuScrolloView.h"
#import "ELButtonExtention.h"
#import "ELMyofascialMenuModel.h"
@interface ELMyofascialBottomView()
@property(nonatomic,strong)UIImageView *MyofascialBottomImageView;
@property(nonatomic,strong) ELButtonExtention *determineButton;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIImageView *timeIcon;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *bluetoothImageView;
@property(nonatomic,strong)UILabel *minutesLabel;
@property(nonatomic,strong)UILabel *gearLabel;
@property(nonatomic,strong)UIView *rightContentView;
@property(nonatomic,strong)UIImageView *rightIconImageView;
@property(nonatomic,strong)UILabel *rightTitle;
@property(nonatomic,strong) ELMyofascialMenuScrolloView *timeListView;
@property(nonatomic,strong) ELMyofascialMenuScrolloView *gearListView;
@end

@implementation ELMyofascialBottomView

-(void)ELSinitConfingViews{
    self.backgroundColor = MainThemColor;
    _MyofascialBottomImageView = ({
        UIImageView *iv = [[UIImageView alloc]init];
        iv.clipsToBounds = YES;
        iv.userInteractionEnabled = YES;
        iv.image = [UIImage imageNamed:@"ELMyofascialBottom_icon"];
        [self addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(kSAdap_V(106));
        }];
        iv;
    });
    
    _determineButton = ({
        ELButtonExtention *iv = [ELButtonExtention buttonWithType:UIButtonTypeCustom];
        UIImage *size = [UIImage imageNamed:@"BluetoothConnection"];
        [iv setImage:size forState:UIControlStateNormal];
        [iv setImage:size forState:UIControlStateHighlighted];
        [iv setImage:size forState:UIControlStateDisabled];
        [iv setImage:[UIImage imageNamed:@"BluetoothPause"] forState:UIControlStateSelected];
        iv.adjustsImageWhenHighlighted = NO;
        iv.showsTouchWhenHighlighted = NO;
        iv.isExpandClick = YES;
        [iv addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size.size);
            make.centerY.mas_equalTo(self.MyofascialBottomImageView.mas_top);
            make.centerX.mas_equalTo(self.MyofascialBottomImageView);
        }];
        iv;
    });
    
    _timeLabel = ({
        UILabel *iv = [[UILabel alloc] init];
        iv.textColor = MainThemColor;
        iv.textAlignment = NSTextAlignmentCenter;
        UIFont *contenFont =[UIFont ELPingFangSCRegularFontOfSize:kSaFont(13.0)];
        iv.font = contenFont;
        iv.text = @"时间";
        [self.MyofascialBottomImageView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.MyofascialBottomImageView.mas_top).offset(kSAdap_V(10));
            make.left.mas_equalTo(self.MyofascialBottomImageView.mas_left).mas_offset(kSAdap(35));
            make.height.mas_equalTo(kSAdap_V(18.5));
            make.width.mas_equalTo(kSAdap(30.0));
        }];
        iv;
    });
    
    _timeIcon = ({
        UIImageView *iv = [[UIImageView alloc]init];
        iv.clipsToBounds = YES;
        UIImage *icon  = [UIImage imageNamed:@"MyofascialTimeIcon"];
        iv.image = icon ;
        [self.MyofascialBottomImageView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.timeLabel.mas_right).offset(kSAdap(45.6));
            make.centerY.mas_equalTo(self.timeLabel);
            make.size.mas_equalTo(icon.size);
        }];
        iv;
    });
    
    _titleLabel = ({
        UILabel *iv = [[UILabel alloc] init];
        iv.textColor = MainThemColor;
        iv.textAlignment = NSTextAlignmentCenter;
        UIFont *contenFont =[UIFont ELPingFangSCRegularFontOfSize:kSaFont(13.0)];
        iv.font = contenFont;
        iv.text = @"强度";
        [self.MyofascialBottomImageView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.MyofascialBottomImageView.mas_top).offset(kSAdap_V(10));
            make.right.mas_equalTo(self.MyofascialBottomImageView.mas_right).mas_offset(-kSAdap(35));
            make.height.mas_equalTo(kSAdap_V(18.5));
            make.width.mas_equalTo(kSAdap(30.0));
        }];
        iv;
    });
    
    _bluetoothImageView = ({
        UIImageView *iv = [[UIImageView alloc]init];
        iv.clipsToBounds = YES;
        UIImage *icon  = [UIImage imageNamed:@"blueBloth_open"];
        iv.image = icon ;
        [self.MyofascialBottomImageView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.MyofascialBottomImageView);
            make.bottom.mas_equalTo(self.MyofascialBottomImageView.mas_bottom).offset(kSAdap(-20));
            make.size.mas_equalTo(icon.size);
        }];
        iv;
    });
    
    _minutesLabel = ({
        UILabel *iv = [[UILabel alloc] init];
        iv.textColor = MainThemColor;
        iv.textAlignment = NSTextAlignmentCenter;
        UIFont *contenFont =[UIFont ELPingFangSCRegularFontOfSize:kSaFont(12.0)];
        iv.font = contenFont;
        iv.text = @"分钟";
        [self.MyofascialBottomImageView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.MyofascialBottomImageView.mas_bottom).offset(kSAdap(-10));
            make.left.mas_equalTo(self.MyofascialBottomImageView.mas_left).mas_offset(kSAdap(36));
            make.height.mas_equalTo(kSAdap_V(18.5));
            make.width.mas_equalTo(kSAdap(26));
        }];
        iv;
    });
    
    _gearLabel = ({
        UILabel *iv = [[UILabel alloc] init];
        iv.textColor = MainThemColor;
        iv.textAlignment = NSTextAlignmentCenter;
        UIFont *contenFont =[UIFont ELPingFangSCRegularFontOfSize:kSaFont(12.0)];
        iv.font = contenFont;
        iv.text = @"档位";
        [self.MyofascialBottomImageView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.minutesLabel.mas_top);
            make.right.mas_equalTo(self.MyofascialBottomImageView.mas_right).mas_offset(kSAdap(-36));
            make.height.mas_equalTo(self.minutesLabel);
            make.width.mas_equalTo(self.minutesLabel);
        }];
        iv;
    });
    
    _timeListView = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 0.f;
        flowLayout.minimumLineSpacing = kSAdap(5.0);
        flowLayout.sectionInset = UIEdgeInsetsZero;
        flowLayout.itemSize = CGSizeMake(kSAdap(20.0), kSAdap_V(32.0));
        ELMyofascialMenuScrolloView *iv = [[ELMyofascialMenuScrolloView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.MyofascialBottomImageView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.timeLabel.mas_centerX);
            make.top.mas_equalTo(self.timeLabel.mas_bottom).mas_offset(kSAdap_V(12.0));
            make.width.mas_equalTo(kSAdap(65.0));
            make.height.mas_equalTo(kSAdap_V(32.0));
        }];
        iv;
    });
    
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i< 10; i++) {
        ELMyofascialMenuModel *model = [[ELMyofascialMenuModel alloc]init];
        model.title = [NSString stringWithFormat:@"%ld",i];
        [list addObject:model];
    }
    [self.timeListView initWithSouce:list];
    
    _gearListView = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 0.f;
        flowLayout.minimumLineSpacing = kSAdap(5.0);
        flowLayout.sectionInset = UIEdgeInsetsZero;
        flowLayout.itemSize = CGSizeMake(kSAdap(20.0), kSAdap_V(32.0));
        ELMyofascialMenuScrolloView *iv = [[ELMyofascialMenuScrolloView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.MyofascialBottomImageView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.titleLabel.mas_centerX);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(kSAdap_V(12.0));
            make.width.mas_equalTo(kSAdap(65.0));
            make.height.mas_equalTo(kSAdap_V(32.0));
        }];
        iv;
    });
    
    NSMutableArray *gers = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i< 10; i++) {
        ELMyofascialMenuModel *model = [[ELMyofascialMenuModel alloc]init];
        model.title = [NSString stringWithFormat:@"%ld",i];
        [gers addObject:model];
    }
    [self.gearListView initWithSouce:gers];
    
    
    _rightContentView = ({
        UIView *iv = [[UIView alloc] init];
        [self addSubview:iv];
        iv.backgroundColor = [UIColor whiteColor];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kSAdap_V(24));
            make.width.mas_equalTo(kSAdap(74));
            make.right.mas_equalTo(self.MyofascialBottomImageView.mas_right);
            make.top.mas_equalTo(self.determineButton.mas_top).offset(1);
        }];
        iv;
    });
    
    _rightIconImageView = ({
        UIImageView *iv = [[UIImageView alloc]init];
        iv.clipsToBounds = YES;
        UIImage *icon  = [UIImage imageNamed:@"update_icon"];
        iv.image = icon ;
        [self.rightContentView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.rightContentView).offset(kSAdap(5));
            make.centerY.mas_equalTo(self.rightContentView);
            make.size.mas_equalTo(icon.size);
        }];
        iv;
    });
    
    _rightTitle = ({
        UILabel *iv = [[UILabel alloc] init];
        iv.textColor = MainThemColor;
        UIFont *contenFont =[UIFont ELPingFangSCRegularFontOfSize:kSaFont(11.0)];
        iv.font = contenFont;
        iv.text = @"250:00";
        [self.rightContentView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.rightContentView);
            make.right.mas_equalTo(self.rightContentView.mas_right);
            make.left.mas_equalTo(self.rightIconImageView.mas_right).offset(kSAdap(5));
            make.height.mas_equalTo(kSAdap_V(20));
        }];
        iv;
    });
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.rightContentView UILayoutCornerRadiusType:UILayoutCornerRadiusLeft withCornerRadius:kSAdap_V(12)];
}
-(void)Click:(UIButton *)sender{
    
    
}
@end