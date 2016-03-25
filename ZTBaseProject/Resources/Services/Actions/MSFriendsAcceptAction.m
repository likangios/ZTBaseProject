//
//  MSFriendsAcceptAction.m
//  ms_sport
//
//  Created by FengLing on 16/2/20.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSFriendsAcceptAction.h"

@implementation MSFriendsAcceptAction
- (instancetype)initWithSenderUid:(NSString *)sender_uid{
    self= [super initWithActionURLString:@"friends/accept.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"sender_uid"] = sender_uid;
    }
    self.isValid = YES;
    return self;
}
@end
