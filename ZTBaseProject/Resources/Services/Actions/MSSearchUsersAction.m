//
//  MSSearchUsersAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/23.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSSearchUsersAction.h"

@implementation MSSearchUsersAction

- (instancetype)initWithkeyword:(NSString *)keyword offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"search/users.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:keyword,@"keyword",offset,@"offset",numLimit,@"limit", nil];
    }
    self.isValid = YES;
    return self;
    
}
@end
