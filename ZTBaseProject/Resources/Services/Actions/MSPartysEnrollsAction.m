//
//  MSPartysEnrollsAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/16.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSPartysEnrollsAction.h"

@implementation MSPartysEnrollsAction
- (instancetype)initWithPartysID:(NSString *)party_id offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"partys/enrolls.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:party_id,@"party_id",offset,@"offset",numLimit,@"limit", nil];
    }
    
    self.isValid = YES;
    return self;
    
}

@end
