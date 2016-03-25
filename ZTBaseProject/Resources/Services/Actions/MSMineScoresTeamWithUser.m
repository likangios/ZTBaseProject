//
//  MSMineScoresTeamWithUser.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/2.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSMineScoresTeamWithUser.h"

@implementation MSMineScoresTeamWithUser
- (instancetype)initWithTeamUid:(NSString *)my_team_id Offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"scores/team/matchs.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"my_team_id"] = my_team_id;
        self.parameters[@"offset"] = offset;
        self.parameters[@"numLimit"] = numLimit;
    }
    self.isValid = YES;
    return self;
}
@end
