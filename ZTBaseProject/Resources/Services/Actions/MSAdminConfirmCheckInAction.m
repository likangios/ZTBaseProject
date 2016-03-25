//
//  MSAdminConfirmCheckInAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/6.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSAdminConfirmCheckInAction.h"

@implementation MSAdminConfirmCheckInAction
- (instancetype)initAdminConfirmCheckInWithParty_id:(NSString *)party_id target_uid:(NSString *)target_uid{
    NSString *url = [NSString stringWithFormat:@"admin/confirm_checkin/%@.json",party_id];
    self = [super initWithActionURLString:url];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"party_id"] = party_id;
        self.parameters[@"target_uid"] = target_uid;
        
    }
    self.isValid = YES;
    return self ;
}
@end
