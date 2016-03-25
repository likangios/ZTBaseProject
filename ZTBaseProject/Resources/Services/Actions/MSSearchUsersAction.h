//
//  MSSearchUsersAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/23.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSSearchUsersAction : MSActionGetBase
- (instancetype)initWithkeyword:(NSString *)keyword offset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
