//
//  MSPartysMineAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/16.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSPartysMineAction.h"

@implementation MSPartysMineAction
- (instancetype)initWithPartysMineListoffset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"partys/mine.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:offset,@"offset",numLimit,@"limit", nil];
    }
    
    self.isValid = YES;
    return self;
    
}
@end
