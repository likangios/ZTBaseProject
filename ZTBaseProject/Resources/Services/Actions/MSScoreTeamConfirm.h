//
//  MSScoreTeamConfirm.h
//  ms_sport
//
//  Created by FengLing on 16/3/15.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSScoreTeamConfirm : MSActionPostBase
- (instancetype)initWithTeam_id:(NSString *)team_id Score_id:(NSString *)score_id;
@end
