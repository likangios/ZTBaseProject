//
//  MSActivityDetailAction.h
//  ms_sport
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSActivityDetailAction : MSActionGetBase

/**
 *  获取活动详情
 *
 *  @param party_id <#party_id description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithActivityDetailParty_id:(NSString *)party_id;

@end
