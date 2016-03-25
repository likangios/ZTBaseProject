//
//  MSTopsAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/9.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSTopsAction.h"


@implementation MSTopsAction
- (instancetype)initWithTopType:(NSString *)type dateType:(NSString *)dateType{
    self = [super initWithActionURLString:@"users/tops.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
            self.parameters[@"top_type"] = type;
        self.parameters[@"time_type"] = dateType;
    }
    self.isValid = YES;
    return self;
}
@end
