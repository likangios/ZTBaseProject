//
//  MSFriendsMineAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/23.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSFriendsMineAction.h"

@implementation MSFriendsMineAction
- (instancetype)initFriendsMine{
    self = [super initWithActionURLString:@"friends/mine.json"];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
