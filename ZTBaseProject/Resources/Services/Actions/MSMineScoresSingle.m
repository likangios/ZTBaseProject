//
//  MSMineScoresSingle.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/28.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSMineScoresSingle.h"

@implementation MSMineScoresSingle
- (instancetype)initOffset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"scores/single/target_users.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"offset"] = offset;
        self.parameters[@"numLimit"] = numLimit;
    }
    self.isValid = YES;
    return self;
}
@end
