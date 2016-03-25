//
//  MSEditSelfAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/30.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSEditSelfAction.h"

@implementation MSEditSelfAction

-(instancetype)initWithNickName:(NSString *)nickname  sign:(NSString *)sign profile_image:(UIImage *)image{
    self = [super initWithActionURLString:@"users/editself.json"];
    if (self) {
    
        self.parameters = [NSMutableDictionary dictionary];
        
        self.parameters[@"nickname"] = nickname;
        if (sign) {
        self.parameters[@"sign"] = sign;
        }
    }
    if (image) {
        self.upload_image = image;
        self.upload_image_param_name = @"profile_image";
    }
    self.isValid = YES;

    return self;
}

@end
