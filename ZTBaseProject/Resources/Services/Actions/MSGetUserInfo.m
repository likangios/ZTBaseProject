//
//  MSGetUserInfo.m
//  ms_sport
//
//  Created by FengLing on 16/2/2.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSGetUserInfo.h"

@implementation MSGetUserInfo
- (instancetype)initWithUserId:(NSString *)userid{
    NSString *url = [NSString stringWithFormat:@"users/%@.json",userid];
    self = [super initWithActionURLString:url];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
