//
//  MSGetTeamMineAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/12.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSGetTeamMineAction.h"


@implementation MSGetTeamMineAction

- (instancetype)initWithOnlyConfirm:(NSNumber *)only_confirm offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"teams/mine.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:only_confirm,@"only_confirm",offset,@"offset",numLimit,@"limit", nil];
    }
    
    self.isValid = YES;
    return self;
    
}
@end
