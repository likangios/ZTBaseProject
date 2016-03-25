//
//  MSNotifysReadWithTypeAction.m
//  ms_sport
//
//  Created by FengLing on 16/2/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSNotifysReadWithTypeAction.h"

@implementation MSNotifysReadWithTypeAction
- (instancetype)initWithType:(NSString *)type{
    self = [super initWithActionURLString:@"notifys/read_with_type.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"type"] = type;
    }
    self.isValid = YES;
    return self;
}
@end
