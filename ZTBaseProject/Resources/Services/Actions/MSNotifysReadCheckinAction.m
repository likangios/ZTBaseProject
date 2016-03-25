//
//  MSNotifysReadCheckinAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/6.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSNotifysReadCheckinAction.h"

@implementation MSNotifysReadCheckinAction
- (instancetype)initWithPartyID:(NSString *)party_id{
    self = [super initWithActionURLString:@"notifys/read_checkin.json"];
    if (self) {
        
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"party_id"] = party_id;
    }
    self.isValid = YES;
    return self;
}
@end
