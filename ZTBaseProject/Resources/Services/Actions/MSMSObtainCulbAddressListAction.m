//
//  MSMSObtainCulbAddressListAction.m
//  ms_sport
//
//  Created by apple on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSMSObtainCulbAddressListAction.h"

@implementation MSMSObtainCulbAddressListAction

- (id)initWithObtainAddressListParty_id:(NSString *)party_id{
    self = [super initWithActionURLString:@"clubs/party_address_list.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:party_id,@"party_id", nil];
    }
    self.isValid = YES;
    return self;
    
}


@end
