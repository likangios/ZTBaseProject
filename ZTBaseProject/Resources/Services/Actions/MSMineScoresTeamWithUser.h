//
//  MSMineScoresTeamWithUser.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/2.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSMineScoresTeamWithUser : MSActionGetBase
- (instancetype)initWithTeamUid:(NSString *)my_team_id Offset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
