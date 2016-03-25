//
//  MSFriendsSendAction.m
//  ms_sport
//
//  Created by FengLing on 16/2/20.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSFriendsSendAction.h"

@implementation MSFriendsSendAction

- (instancetype)initWithUid:(NSString *)uid withContent:(NSString *)content{
    self= [super initWithActionURLString:@"friends/send.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"uid"] = uid;
        if (content.length) {
            self.parameters[@"hello"] = content;
        }
    }
    self.isValid = YES;
    return self;
}
@end
