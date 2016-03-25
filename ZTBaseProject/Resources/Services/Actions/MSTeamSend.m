//
//  MSTeamSend.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/12.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSTeamSend.h"

@implementation MSTeamSend
-(instancetype)initWithUid:(NSString *)uid AndTeamName:(NSString *)team_name{
    self = [super initWithActionURLString:@"teams/send.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"uid"] = uid;
        self.parameters[@"team_name"] = team_name;
    }
    self.isValid = YES;
    return self;
}
@end
