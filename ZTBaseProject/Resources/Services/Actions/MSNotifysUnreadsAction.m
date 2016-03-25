//
//  MSNotifysUnreadsAction.m
//  ms_sport
//
//  Created by FengLing on 16/2/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSNotifysUnreadsAction.h"

@implementation MSNotifysUnreadsAction
- (instancetype)initNotifysUnreads{
    self = [super initWithActionURLString:@"notifys/unreads.json"];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
