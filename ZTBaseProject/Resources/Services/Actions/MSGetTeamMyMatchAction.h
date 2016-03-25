//
//  MSGetTeamMyMatchAction.h
//  ms_sport
//
//  Created by FengLing on 16/3/15.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSGetTeamMyMatchAction : MSActionGetBase
- (instancetype)initWithOffset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
