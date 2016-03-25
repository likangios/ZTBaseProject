//
//  MSPublishPartys.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSPublishPartys.h"

@implementation MSPublishPartys
-(instancetype)initWithName:(NSString *)name party_time:(NSString *)party_time address_id:(NSString *)address_id
               person_count:(NSNumber *)person_count party_price:(NSNumber *)party_price
                       desc:(NSString *)desc
                   sub_list:(NSDictionary *)sub_list
                   is_timer:(NSNumber *)is_timer{
    self = [super initWithActionURLString:@"partys.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        
        self.parameters[@"name"] = name;
        self.parameters[@"party_time"] = party_time;
        self.parameters[@"address_id"] = address_id;
        self.parameters[@"person_count"] = person_count;
        self.parameters[@"party_price"] = party_price;
        if (desc) {
            self.parameters[@"desc"] = desc;
        }
        if (sub_list) {
            self.parameters[@"sub_list"] = [self dictionaryToJson:sub_list];
        }
        if (is_timer) {
            self.parameters[@"is_timer"] = is_timer;
        }
        
    }
    self.isValid = YES;
    
    return self;
}
- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
@end
