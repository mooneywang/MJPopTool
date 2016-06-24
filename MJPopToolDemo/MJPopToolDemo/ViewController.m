//
//  ViewController.m
//  MJPopToolDemo
//
//  Created by Mengjie.Wang on 2016/06/22.
//  Copyright © 2016年 王梦杰. All rights reserved.
//

#import "ViewController.h"
#import "PopOutView.h"
#import "MJPopTool.h"

@interface ViewController ()

@property (nonatomic, strong) PopOutView *popOutView;

@end

@implementation ViewController

- (PopOutView *)popOutView {
    if (!_popOutView) {
        _popOutView = [[PopOutView alloc] init];
        _popOutView.frame = CGRectMake(0, 0, 200, 300);
        _popOutView.dismissBlock = ^(PopOutView *popOutView) {
            [[MJPopTool sharedInstance] closeAnimated:YES];
        };
    }
    return _popOutView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)pop:(UIButton *)sender {
    [[MJPopTool sharedInstance] popView:self.popOutView animated:YES];
}

@end
