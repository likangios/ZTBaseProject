//
//  MSScoreTeam.m
//  ms_sport
//
//  Created by FengLing on 16/3/15.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSScoreTeam.h"

@implementation MSScoreTeam
- (instancetype)initWithOurTid:(NSString *)our_tid AndTargetUid:(NSString *)target_tid Our_score:(NSNumber *)our_score Your_score:(NSNumber *)your_score  Play_at_time:(NSString *)play_at_time  Play_duration:(NSNumber *)play_duration Address_id:(NSString *)address_id{
    self = [super initWithActionURLString:@"scores/team.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"our_tid"] = our_tid;
        self.parameters[@"target_tid"] = target_tid;
        self.parameters[@"our_score"] = our_score;
        self.parameters[@"your_score"] = your_score;
        self.parameters[@"play_at_time"] = play_at_time;
        self.parameters[@"play_duration"] = play_duration;
        self.parameters[@"address_id"] = address_id;
    }
    self.isValid = YES;
    return self;
}

@end
