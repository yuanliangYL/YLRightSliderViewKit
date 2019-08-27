//
//  ViewController.m
//  YLRightSlideOutView
//
//  Created by AlbertYuan on 2019/8/26.
//  Copyright © 2019 Yunaliang. All rights reserved.
//

#import "ViewController.h"
#import "YLRightSliderView.h"
@interface ViewController ()
@property(nonatomic,strong) YLRightSliderView *rightSlide;
@end

@implementation ViewController

-(YLRightSliderView *)rightSlide{
    if (!_rightSlide) {
        _rightSlide = [YLRightSliderView new];
    }
    return _rightSlide;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
}


- (IBAction)showRightView:(UIButton *)sender {
    
     [self.rightSlide showView];
    
}

@end
