//
//  MSAdminRechargeToCardAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/6.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSAdminRechargeToCardAction.h"

@implementation MSAdminRechargeToCardAction
- (instancetype)initWithTarget_uid:(NSString *)target_uid Times:(NSNumber *)times{
    self = [super initWithActionURLString:@"admin/recharge_to_card.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"target_uid"] = target_uid;
        self.parameters[@"times"] = times;
    }
    self.isValid = YES;
    return self;
}
@end
