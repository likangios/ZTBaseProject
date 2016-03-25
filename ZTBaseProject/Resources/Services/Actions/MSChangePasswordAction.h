//
//  MSChangePasswordAction.h
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSActionBase.h"

@interface MSChangePasswordAction : MSActionPostBase
-(instancetype)initWithPhone:(NSString *)phone andToken:(NSString *)token andPWD:(NSString *)pwd;
@end
