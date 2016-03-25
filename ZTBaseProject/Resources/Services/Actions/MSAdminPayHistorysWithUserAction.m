//
//  MSAdminPayHistorysWithUserAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/6.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSAdminPayHistorysWithUserAction.h"

@implementation MSAdminPayHistorysWithUserAction

- (instancetype)initPayHistoryWithUserOffset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"admin/pay_historys_with_user.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:offset,@"offset",numLimit,@"limit", nil];
    }
    
    self.isValid = YES;
    return self;
    
}
@end
