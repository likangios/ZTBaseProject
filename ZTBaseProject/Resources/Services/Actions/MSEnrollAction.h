//
//  MSEnrollAction.h
//  ms_sport
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSEnrollAction : MSActionPostBase
/**
 *  报名一个活动
 *
 *  @param party_id 活动的ID
 *
 *  @return <#return value description#>
 */

- (instancetype)initWithEnrollParty_id:(NSString *)party_id;

@end
