//
//  YLRightSliderView.h
//  YLRightSlideOutView
//
//  Created by AlbertYuan on 2019/8/26.
//  Copyright © 2019 Yunaliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YLRightSliderViewDelegate <NSObject>

-(void)didSeletedArowWithData:(NSIndexPath *_Nullable)indexpath;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YLRightSliderView : UIView

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic,weak) id<YLRightSliderViewDelegate> delegate;


/**
 显示视图
 */
-(void)showView;


/**
 移除视图
 */
-(void)hideView;

@end

NS_ASSUME_NONNULL_END
