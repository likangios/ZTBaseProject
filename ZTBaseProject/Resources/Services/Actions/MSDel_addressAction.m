//
//  MSDel_addressAction.m
//  ms_sport
//
//  Created by apple on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSDel_addressAction.h"

@implementation MSDel_addressAction

- (id)initWithDel_addressPa_id:(NSString *)pa_id{
    self = [super initWithActionURLString:@"clubs/del_party_address.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:pa_id,@"pa_id", nil];
    }
    self.isValid = YES;
    return self;
}


@end
