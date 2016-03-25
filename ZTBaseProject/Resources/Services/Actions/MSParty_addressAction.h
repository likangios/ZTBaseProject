//
//  MSParty_addressAction.h
//  ms_sport
//
//  Created by apple on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSParty_addressAction : MSActionPostBase

- (id)initWithParty_AddressLocation:(NSString *)location address:(NSString *)address withPhone:(NSString *)phone;

@end
