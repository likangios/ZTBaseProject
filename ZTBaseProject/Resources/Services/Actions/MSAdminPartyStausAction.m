//
//  MSAdminPartyStausAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/5.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSAdminPartyStausAction.h"

@implementation MSAdminPartyStausAction
- (instancetype)initAdminPartyStatus{
    self = [super initWithActionURLString:@"admin/party_status.json"];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
