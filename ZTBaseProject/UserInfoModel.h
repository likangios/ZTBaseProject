//
//  UserInfoModel.h
//  ZTBaseProject
//
//  Created by FengLing on 16/9/2.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <JSONModel.h>

@interface UserInfoModel : JSONModel

@property (nonatomic,strong) NSString               *account;

@property (nonatomic,strong) NSString               *password;

@end
