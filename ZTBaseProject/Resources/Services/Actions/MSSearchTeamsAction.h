//
//  MSSearchTeamsAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/15.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSSearchTeamsAction : MSActionGetBase
- (instancetype)initWithkeyword:(NSString *)keyword offset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
