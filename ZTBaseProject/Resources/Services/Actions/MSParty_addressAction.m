//
//  MSParty_addressAction.m
//  ms_sport
//
//  Created by apple on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSParty_addressAction.h"

@implementation MSParty_addressAction

- (id)initWithParty_AddressLocation:(NSString *)location address:(NSString *)address withPhone:(NSString *)phone{
    self = [super initWithActionURLString:@"clubs/add_party_address.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:location,@"location",address,@"address", nil];
        if (phone) {
            [self.parameters setValue:phone forKey:@"phone_num"];
        }
    }
    self.isValid = YES;
    return self;
    
}


@end
