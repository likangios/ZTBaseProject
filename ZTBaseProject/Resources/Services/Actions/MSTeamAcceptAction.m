//
//  MSTeamAcceptAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/12.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSTeamAcceptAction.h"

@implementation MSTeamAcceptAction
-(instancetype)initWithTeamID:(NSString *)team_id{
    self = [super initWithActionURLString:@"teams/accept.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"team_id"] = team_id;
    }
    self.isValid = YES;
    return self;
}
@end
