//
//  MSSearchTeamsAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/15.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSSearchTeamsAction.h"

@implementation MSSearchTeamsAction
- (instancetype)initWithkeyword:(NSString *)keyword offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"search/teams.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:keyword,@"keyword",offset,@"offset",numLimit,@"limit", nil];
    }
    self.isValid = YES;
    return self;
    
}
@end
