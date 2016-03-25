//
//  MSAdminPayHistorys.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/6.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSAdminPayHistorys : MSActionGetBase
- (instancetype)initPayHistoryWithUserID:(NSString *)uid offset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
