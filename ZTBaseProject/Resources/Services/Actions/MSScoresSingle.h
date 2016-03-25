//
//  MSScoresSingle.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/28.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"
/**
 发起记分
 */
@interface MSScoresSingle : MSActionPostBase
- (instancetype)initWIthTargetUid:(NSString *)target_uid My_score:(NSNumber *)my_score Your_score:(NSNumber *)your_score  Play_at_time:(NSString *)play_at_time  Play_duration:(NSNumber *)play_duration Address_id:(NSString *)address_id;
@end
