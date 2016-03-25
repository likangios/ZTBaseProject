//
//  MSAdminPayHistorys.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/6.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSAdminPayHistorys.h"

@implementation MSAdminPayHistorys
- (instancetype)initPayHistoryWithUserID:(NSString *)uid offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"admin/pay_historys.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:uid,@"uid",offset,@"offset",numLimit,@"limit", nil];
    }
    
    self.isValid = YES;
    return self;
    
}
@end
