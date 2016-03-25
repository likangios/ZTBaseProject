//
//  MSEnrollAction.m
//  ms_sport
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSEnrollAction.h"

@implementation MSEnrollAction

- (instancetype)initWithEnrollParty_id:(NSString *)party_id{
    self = [super initWithActionURLString:[NSString stringWithFormat:@"partys/enroll/%@.json",party_id]];
    
    if (self) {
//        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:party_id,@"party_id", nil];
    }
    self.isValid = YES;
    return self;
}



@end
