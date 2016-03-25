//
//  MSUpdateDeviceToken.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/30.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSUpdateDeviceToken.h"

@implementation MSUpdateDeviceToken

- (instancetype)initWithDeviceToken:(NSString *)token{
    
    self=  [super initWithActionURLString:@"users/update_device_token.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"device_token"] = token;
        self.parameters[@"device_type"] = @"iphone";
    }
    self.isValid = YES;
    return self;
}
@end
