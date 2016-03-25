//
//  MSActivityDetailAction.m
//  ms_sport
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActivityDetailAction.h"

@implementation MSActivityDetailAction

- (instancetype)initWithActivityDetailParty_id:(NSString *)party_id{
    self = [super initWithActionURLString:[NSString stringWithFormat:@"partys/%@.json",party_id]];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}



@end
