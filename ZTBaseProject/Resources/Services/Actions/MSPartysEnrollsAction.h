//
//  MSPartysEnrollsAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/16.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSPartysEnrollsAction : MSActionGetBase
- (instancetype)initWithPartysID:(NSString *)party_id offset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
