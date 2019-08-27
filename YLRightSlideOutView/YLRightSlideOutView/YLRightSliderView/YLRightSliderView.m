//
//  YLRightSliderView.m
//  YLRightSlideOutView
//
//  Created by AlbertYuan on 2019/8/26.
//  Copyright © 2019 Yunaliang. All rights reserved.
//

#import "YLRightSliderView.h"
#import "RightSliderViewCell.h"
#define RightSliderWIDTH [UIScreen mainScreen].bounds.size.width
#define RightSliderHEIGHT [UIScreen mainScreen].bounds.size.height

@interface YLRightSliderView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

//数据视图
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation YLRightSliderView

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(RightSliderWIDTH * 0.25, 0, RightSliderWIDTH * 0.75, RightSliderHEIGHT) style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.bounces = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RightSliderViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RightSliderViewCell class])];
        if(@available(iOS 11.0, *)){
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        }
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    
    return _tableView;
}

-(instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0];
        //self.backgroundColor = [UIColor yellowColor];
        
        //initUI
        [self addSubview:self.tableView];
        [self addLeftCanSliderGustureView];

        self.frame = CGRectMake(RightSliderWIDTH, 0, RightSliderWIDTH, RightSliderHEIGHT);
        
        [[[UIApplication sharedApplication ]keyWindow ] addSubview:self];
        
        
    }
    
    return self;
}


/**
 添加滑动移除手势
 */
-(void)addLeftCanSliderGustureView{
    
    UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, RightSliderWIDTH * 0.25, RightSliderHEIGHT)];
    left.backgroundColor = [UIColor clearColor];
    [self addSubview:left];
    
    //空白添加手势
    UISwipeGestureRecognizer *click3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiperHideView)];
    click3.direction = UISwipeGestureRecognizerDirectionRight;
    [left addGestureRecognizer:click3];
    
}

#pragma mark - about UItableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return self.dataArr.count;
    
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RightSliderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RightSliderViewCell class])];
    cell.selectionStyle = 0;
    cell.infoLabel.text = [NSString stringWithFormat:@"%ld=====%ld",indexPath.section,indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UIView *header = [[UIView alloc] init];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, 80, 20)];
    lable.text = @"纸品分类";
    lable.font = [UIFont fontWithName:@"PingFangSC-Bold" size:15];
    lable.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [header addSubview:lable];
    
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 55.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self hideView];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSeletedArowWithData:)]) {
        [self.delegate didSeletedArowWithData:indexPath];
    }
}


- (void)showView{

    self.alpha = 1;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame =  CGRectMake( 0 , 0, RightSliderWIDTH, RightSliderHEIGHT);
    }];
}


-(void)hideView{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.frame =  CGRectMake( RightSliderWIDTH , 0, RightSliderWIDTH, RightSliderHEIGHT);;
    }];
}

-(void)swiperHideView{
    
    [UIView animateWithDuration:0.4 animations:^{
        self.frame =  CGRectMake( RightSliderWIDTH , 0, RightSliderWIDTH, RightSliderHEIGHT);
    } completion:^(BOOL finished) {
        self.alpha = 1;
    }];
}

-(void)dealloc{
    [self removeFromSuperview];
}

@end
