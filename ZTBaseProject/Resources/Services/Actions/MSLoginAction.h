//
//  MSLoginAction.h
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSActionBase.h"

@interface MSLoginAction : MSActionPostBase
/**
 *  new 并且初始化对象
 *
 *  @param phone_number 电话号码
 *  @param password     密码
 *  @param nickname     昵称
 *  @param confirm_code 验证码
 *  @param upload_image 上传的头像图片
 *
 *  @return 返回对象，有效与否看 IsValid 属性
 */
-(id) initWithPhoneNumber:(NSString *) phone_number
                 Password:(NSString *) password;
@end
