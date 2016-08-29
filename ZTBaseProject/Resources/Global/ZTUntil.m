//
//  ZTUntil.m
//  ZTBaseProject
//
//  Created by FengLing on 16/3/10.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "ZTUntil.h"
#import <MBProgressHUD.h>

@interface ZTUntil ()

@property (nonatomic,strong) UIWindow               *overlayWindow;

@end

@implementation ZTUntil

+(instancetype)shared{
    static id _sharedInstance=  nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc]init];
    });
    return _sharedInstance;
}


+(UIView *) showErrorAlertViewWithMessage:(NSString *) msg Delegate:(id) delegate
{
    return  [ZTUntil showAlertViewTitle:@"Oops!" Message:msg Delegate:delegate];
}

+(UIView *) showAlertViewTitle:(NSString *) title Message:(NSString *) msg Delegate:(id) delegate
{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:title
                                                         message:msg
                                                        delegate:delegate
                                               cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                               otherButtonTitles:nil];
    [alertView show];
    return alertView;
}

+(UIView *) showHttprequestErrorAlertViewWithDelegate:(id) delegate
{
    return [ZTUntil showAlertViewTitle:@"Oops!"
                               Message:@"request error"
                              Delegate:delegate];
}

+(MBProgressHUD *) showHttprequestErrorHUDViewAtView:(UIView *) view
{
    return [self showErrorHUDViewAtView:view WithTitle:@"send request faild."];
}

+(MBProgressHUD *) showErrorHUDViewAtView:(UIView *) view WithTitle:(NSString *) title
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = title;
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:2];
    return hud;
}
+ (void)showHUDAddedTo:(UIView *)view{
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}
+ (void)hideAllHUDsForView:(UIView *)view{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

@end
