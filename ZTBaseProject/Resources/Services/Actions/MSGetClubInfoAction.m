//
//  MSGetClubInfoAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/31.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSGetClubInfoAction.h"

@implementation MSGetClubInfoAction

- (instancetype)initWithClubId:(NSString *)clubid{
    NSString *clubStr = [NSString stringWithFormat:@"clubs/%@.json",clubid];
    self=  [super initWithActionURLString:clubStr];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
