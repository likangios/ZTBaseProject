//
//  MSCancelEnrollAction.h
//  ms_sport
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSCancelEnrollAction : MSActionDeleteBase
/**
 *  取消报名
 *
 *  @param party_id 活动ID
 *
 *  @return <#return value description#>
 */

- (instancetype)initWithCanCelEnrollParty_id:(NSString *)party_id;

@end
