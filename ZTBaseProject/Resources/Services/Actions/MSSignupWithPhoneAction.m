//
//  MSSignupWithPhoneAction.m
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSSignupWithPhoneAction.h"

@implementation MSSignupWithPhoneAction
-(id) initWithPhoneNumber:(NSString *) phone_number
              ConfirmCode:(NSString *) confirm_code Password:(NSString *)pwd nickName:(NSString *)nickname auto_login:(NSNumber *)auto_login gender:(NSString *)gender photoImg:(UIImage *)photo{
    self = [super initWithActionURLString:@"users/sign_up.json"];
    if (self) {
        
        self.parameters =[NSMutableDictionary dictionary];
        
        [self.parameters setValue:phone_number forKey:@"phone_num"];
        [self.parameters setValue:pwd forKey:@"password"];
        [self.parameters setValue:confirm_code forKey:@"confirm_code"];
        [self.parameters setValue:nickname forKey:@"nickname"];
        [self.parameters setValue:@"iphone" forKey:@"device_type"];
        [self.parameters setValue:gender forKey:@"gender"];
        if (auto_login) {
            [self.parameters setValue:auto_login forKey:@"auto_login"];
        }
        self.upload_image = photo;
        self.upload_image_param_name = @"photo";
    }
    
    self.isValid = YES;
    return self;
}
@end
