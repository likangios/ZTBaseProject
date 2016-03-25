//
//  MSMineScoresSingleWithUser.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/28.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSMineScoresSingleWithUser : MSActionGetBase
- (instancetype)initWithTargetUid:(NSString *)target_uid Offset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
