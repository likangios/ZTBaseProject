//
//  ZTUntil.h
//  ZTBaseProject
//
//  Created by FengLing on 16/3/10.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface ZTUntil : NSObject

+(UIView *) showErrorAlertViewWithMessage:(NSString *) msg Delegate:(id) delegate;

+(UIView *) showAlertViewTitle:(NSString *) title Message:(NSString *) msg Delegate:(id) delegate
;
+(UIView *) showHttprequestErrorAlertViewWithDelegate:(id) delegate;
+(MBProgressHUD *) showHttprequestErrorHUDViewAtView:(UIView *) view;
+(MBProgressHUD *) showErrorHUDViewAtView:(UIView *) view WithTitle:(NSString *) title;
+ (void)showHUDAddedTo:(UIView *)view;
+ (void)hideAllHUDsForView:(UIView *)view;
@end
