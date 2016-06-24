//
//  PopOutView.h
//  MJPopToolDemo
//
//  Created by Mengjie.Wang on 2016/06/22.
//  Copyright © 2016年 王梦杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopOutView;

typedef void(^PopOutViewDismissBlock)(PopOutView *popOutView);

@interface PopOutView : UIView

@property (nonatomic, copy) PopOutViewDismissBlock dismissBlock;

@end
