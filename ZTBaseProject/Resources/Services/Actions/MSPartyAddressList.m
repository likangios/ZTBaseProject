//
//  MSPartyAddressList.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/27.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSPartyAddressList.h"

@implementation MSPartyAddressList

-(instancetype)initWithParty_id:(NSString *)party_id{
    self = [super initWithActionURLString:@"clubs/party_address_list.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        if (party_id.length) {
            [self.parameters setObject:party_id forKey:@"party_id"];
        }
    }
    self.isValid = YES;
    return self;
}
@end
