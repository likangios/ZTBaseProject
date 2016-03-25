//
//  MSFriendsSendAction.h
//  ms_sport
//
//  Created by FengLing on 16/2/20.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

/**
 发送一个添加好友请求
 */
@interface MSFriendsSendAction : MSActionPostBase
/**
 *  @param uid 目标对象的用户ID
 *
 */
- (instancetype)initWithUid:(NSString *)uid withContent:(NSString *)content;


@end
