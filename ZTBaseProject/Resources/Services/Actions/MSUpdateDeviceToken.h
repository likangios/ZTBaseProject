//
//  MSUpdateDeviceToken.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/30.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSUpdateDeviceToken : MSActionPostBase

- (instancetype)initWithDeviceToken:(NSString *)token;

@end
