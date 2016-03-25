//
//  UINavigationItem+BMargin.h
//  Box
//
//  Created by FengLing on 16/1/4.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  navigationitem 扩展
 */
@interface UINavigationItem (BMargin)
/**
 *  在左边加一个item
 *
 *  @param leftBarButtonItem
 */
- (void)addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;
/**
 *  在右边加一个item
 *
 *  @param rightBarButtonItem
 */
- (void)addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;
/**
 *  在左边加多个items
 *
 *  @param leftBarButtonItems 
 */
- (void)addLeftBarButtonItems:(NSArray *)leftBarButtonItems;

@end
