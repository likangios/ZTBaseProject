//
//  MSSignupWithPhoneAction.h
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSActionBase.h"

@interface MSSignupWithPhoneAction : MSActionPostWithSingleImageBase
-(id) initWithPhoneNumber:(NSString *) phone_number
              ConfirmCode:(NSString *) confirm_code Password:(NSString *)pwd nickName:(NSString *)nickname auto_login:(NSNumber *)auto_login  gender:(NSString *)gender photoImg:(UIImage *)photo;
@end
