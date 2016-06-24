//
//  MJPopTool.m
//  MJPopToolDemo
//
//  Created by Mengjie.Wang on 2016/06/22.
//  Copyright © 2016年 王梦杰. All rights reserved.
//

#import "MJPopTool.h"

@interface MJPopTool ()

/**
 *  @author 王梦杰, 16-06-24 14:06:30
 *
 *  当前弹出的view
 */
@property (nonatomic, strong) UIView *currentView;

@end

@implementation MJPopTool

+ (instancetype)sharedInstance {
    static MJPopTool *_popTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _popTool = [[MJPopTool alloc] init];
    });
    return _popTool;
}

- (void)popView:(UIView *)view animated:(BOOL)animated {
    _currentView = view;
    CGFloat halfScreenWidth = [[UIScreen mainScreen] bounds].size.width * 0.5;
    CGFloat halfScreenHeight = [[UIScreen mainScreen] bounds].size.height * 0.5;
    // 屏幕中心
    CGPoint screenCenter = CGPointMake(halfScreenWidth, halfScreenHeight);
    view.center = screenCenter;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:view];
    
    if (animated) {
        // 将view宽高缩至无限小（点）
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, CGFLOAT_MIN, CGFLOAT_MIN);
        [UIView animateWithDuration:0.3 animations:^{
            // 以动画的形式将view慢慢放大至原始大小的1.2倍
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                // 以动画的形式将view恢复至原始大小
                view.transform = CGAffineTransformIdentity;
            }];
        }];
    }
}

- (void)closeAnimated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            _currentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                _currentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
            } completion:^(BOOL finished) {
                [_currentView removeFromSuperview];
            }];
        }];
    } else {
        [_currentView removeFromSuperview];
    }
}

@end
