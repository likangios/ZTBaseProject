//
//  MSScoresSingle.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/28.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSScoresSingle.h"

@implementation MSScoresSingle

- (instancetype)initWIthTargetUid:(NSString *)target_uid My_score:(NSNumber *)my_score Your_score:(NSNumber *)your_score  Play_at_time:(NSString *)play_at_time  Play_duration:(NSNumber *)play_duration Address_id:(NSString *)address_id{
    
    self = [super initWithActionURLString:@"scores/single.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"target_uid"] = target_uid;
        self.parameters[@"my_score"] = my_score;
        self.parameters[@"your_score"] = your_score;
        self.parameters[@"play_at_time"] = play_at_time;
        self.parameters[@"play_duration"] = play_duration;
        self.parameters[@"address_id"] = address_id;
    }
    self.isValid = YES;
    
    return self;
}
@end
