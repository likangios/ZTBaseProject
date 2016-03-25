//
//  MSGetTeamMineAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/12.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSGetTeamMineAction : MSActionGetBase
- (instancetype)initWithOnlyConfirm:(NSNumber *)only_confirm offset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
