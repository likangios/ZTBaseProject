//
//  MSMineScoresSingleWithUser.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/28.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSMineScoresSingleWithUser.h"

@implementation MSMineScoresSingleWithUser
- (instancetype)initWithTargetUid:(NSString *)target_uid Offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"scores/single/matchs_with_user.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"target_uid"] = target_uid;
        self.parameters[@"offset"] = offset;
        self.parameters[@"numLimit"] = numLimit;
    }
    self.isValid = YES;
    return self;
}

@end
