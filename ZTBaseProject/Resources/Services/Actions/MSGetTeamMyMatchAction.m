//
//  MSGetTeamMyMatchAction.m
//  ms_sport
//
//  Created by FengLing on 16/3/15.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSGetTeamMyMatchAction.h"

@implementation MSGetTeamMyMatchAction
- (instancetype)initWithOffset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"teams/my_match_teams.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:offset,@"offset",numLimit,@"limit", nil];
    }
    self.isValid = YES;
    return self;
    
}
@end
