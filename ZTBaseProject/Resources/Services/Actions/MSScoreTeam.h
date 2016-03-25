//
//  MSScoreTeam.h
//  ms_sport
//
//  Created by FengLing on 16/3/15.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSScoreTeam : MSActionPostBase
- (instancetype)initWithOurTid:(NSString *)our_tid AndTargetUid:(NSString *)target_tid Our_score:(NSNumber *)our_score Your_score:(NSNumber *)your_score  Play_at_time:(NSString *)play_at_time  Play_duration:(NSNumber *)play_duration Address_id:(NSString *)address_id;

@end
