//
//  MSCheckinAction.h
//  ms_sport
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSCheckinAction : MSActionPostBase

/**
 *  初始化签到网络请求
 *
 *  @param party_id 签到的俱乐部ID
 *
 *  @return 返回值
 */
- (instancetype)initCheckParty_id:(NSString *)party_id;

@end
