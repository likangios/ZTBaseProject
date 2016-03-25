//
//  MSFriendsAction.m
//  ms_sport
//
//  Created by FengLing on 16/2/20.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSFriendsAction.h"


//all,pending,accepted


@implementation MSFriendsAction

-(instancetype)initWithFriendsWith:(friendstype)type{
    NSString *tp = @"";
    switch (type) {
        case FriendsTypeAll:
            tp = @"all";
            break;
        case FriendsTypePending:
            tp = @"pending";
            break;
        case FriendsTypeAccepted:
            tp = @"accepted";
            break;
        default:
            break;
    }
    NSString *url = [NSString stringWithFormat:@"friends.json?type=%@",tp];
    
    self = [super initWithActionURLString:url];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
