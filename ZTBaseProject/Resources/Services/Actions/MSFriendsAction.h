//
//  MSFriendsAction.h
//  ms_sport
//
//  Created by FengLing on 16/2/20.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"
typedef enum : NSUInteger {
    FriendsTypeAll,//所有的
    FriendsTypePending,//已申请
    FriendsTypeAccepted,//已同意
} friendstype;

/**
 获取好友申请列表
 
 */
@interface MSFriendsAction : MSActionGetBase

-(instancetype)initWithFriendsWith:(friendstype)type;

@end
