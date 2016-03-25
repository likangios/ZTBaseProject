//
//  MSMineScoresTeam.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/2.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSMineScoresTeam.h"

@implementation MSMineScoresTeam
- (instancetype)initOffset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"scores/double/target_users.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"offset"] = offset;
        self.parameters[@"numLimit"] = numLimit;
    }
    self.isValid = YES;
    return self;
}
@end
