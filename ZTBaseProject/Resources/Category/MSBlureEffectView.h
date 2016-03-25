//
//  MSBlureEffectView.h
//  Box
//
//  Created by 哈哈哈 on 16/1/9.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  毛玻璃效果类 要毛玻璃效果的view 直接 继承这个类
 */
@interface MSBlureEffectView : UIView

@property (nonatomic,assign) UIBlurEffectStyle effectStyle;


@property (nonatomic,assign) CGFloat effectViewAlph;

@end
