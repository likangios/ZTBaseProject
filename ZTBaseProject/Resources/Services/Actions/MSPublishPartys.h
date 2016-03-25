//
//  MSPublishPartys.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSPublishPartys : MSActionPostBase
-(instancetype)initWithName:(NSString *)name party_time:(NSString *)party_time address_id:(NSString *)address_id
               person_count:(NSNumber *)person_count party_price:(NSNumber *)party_price
                       desc:(NSString *)desc
                   sub_list:(NSDictionary *)sub_list
                   is_timer:(NSNumber *)is_timer;
@end
