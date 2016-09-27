//
//  AccountListViewController.h
//  ZTBaseProject
//
//  Created by FengLing on 16/9/27.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserInfoModel;
@interface AccountListViewController : UIViewController

@property (nonatomic,assign) NSInteger             markId;


@property (nonatomic,copy) void(^selectAccount)(UserInfoModel *model);
@end
