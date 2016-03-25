//
//  MSMyMatchAddress.m
//  ms_sport
//
//  Created by FengLing on 16/3/3.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSMyMatchAddress.h"

@implementation MSMyMatchAddress
- (instancetype)init{
    self = [super initWithActionURLString:@"users/my_match_address.json"];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
