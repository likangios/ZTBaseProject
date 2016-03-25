//
//  MSAdminPartyDetailAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/5.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSAdminPartyDetailAction.h"

@implementation MSAdminPartyDetailAction
- (instancetype)initAdminPartyDetailWithParty_id:(NSString *)party_id{
    self = [super initWithActionURLString:@"admin/party_detail_list.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"party_id"] = party_id;
    }
    self.isValid = YES;
    return self;
}
@end
