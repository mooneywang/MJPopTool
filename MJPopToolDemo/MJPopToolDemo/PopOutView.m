//
//  PopOutView.m
//  MJPopToolDemo
//
//  Created by Mengjie.Wang on 2016/06/22.
//  Copyright © 2016年 王梦杰. All rights reserved.
//

#import "PopOutView.h"

@interface PopOutView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation PopOutView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setBackgroundImage:[UIImage imageNamed:@"red_packge_close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_closeButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _imageView.image = [UIImage imageNamed:@"cat.jpg"];
    
    _closeButton.frame = CGRectMake(self.bounds.size.width - 15, -15, 30, 30);
}

/**
 *  @author 王梦杰, 16-06-24 13:06:00
 *
 *  让超出父视图的子视图响应事件
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView *subView in self.subviews) {
            CGPoint tp = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, tp)) {
                view = subView;
            }
        }
    }
    return view;
}

- (void)close {
    if (_dismissBlock) {
        _dismissBlock(self);
    }
}

@end
