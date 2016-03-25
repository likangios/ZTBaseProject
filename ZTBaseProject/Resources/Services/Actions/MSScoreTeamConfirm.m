//
//  MSScoreTeamConfirm.m
//  ms_sport
//
//  Created by FengLing on 16/3/15.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSScoreTeamConfirm.h"

@implementation MSScoreTeamConfirm
- (instancetype)initWithTeam_id:(NSString *)team_id Score_id:(NSString *)score_id{
    
    self = [super initWithActionURLString:@"scores/team/confirm.json"];
    
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"team_id"] = team_id;
        self.parameters[@"score_id"] = score_id;
    }
    self.isValid = YES;
    return self;
}
@end
