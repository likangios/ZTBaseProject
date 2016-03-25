//
//  MSDeleteAddress.m
//  ms_sport
//
//  Created by FengLing on 16/2/1.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSDeleteAddress.h"

@implementation MSDeleteAddress
-(instancetype)initWithDeleteID:(NSString *)pa_id{
    self = [super initWithActionURLString:@"clubs/del_party_address.json"];
    if (self) {
        self.parameters =  [NSMutableDictionary dictionary];
        self.parameters[@"pa_id"]=  pa_id;
    }
    self.isValid = YES;
    return self;
    
}
@end
