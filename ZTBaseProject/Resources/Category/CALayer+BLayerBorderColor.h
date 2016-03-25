//
//  CALayer+BLayerBorderColor.h
//  Box
//
//  Created by FengLing on 16/1/5.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
/**
 *  方便在xib里 加边框颜色的扩展
 */
@interface CALayer (BLayerBorderColor)

@property (nonatomic,strong) UIColor *borderColorWithUIColor;

@property (nonatomic,strong) UIColor *borderSelectedColorWithUIColor;


@end
