//
//  MSHomeListAction.m
//  ms_sport
//
//  Created by apple on 16/1/30.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSHomeListAction.h"

@implementation MSHomeListAction

- (instancetype)initWithHomeListActionTime:(NSString *)timer offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"partys.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:timer,@"time",offset,@"offset",numLimit,@"limit", nil];
    }

    self.isValid = YES;
    return self;
    
}


@end
