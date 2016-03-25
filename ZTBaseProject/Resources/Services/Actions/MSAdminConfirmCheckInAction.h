//
//  MSAdminConfirmCheckInAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/6.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSAdminConfirmCheckInAction : MSActionPostBase
- (instancetype)initAdminConfirmCheckInWithParty_id:(NSString *)party_id target_uid:(NSString *)target_uid;
@end
