//
//  MSHomeListAction.h
//  ms_sport
//
//  Created by apple on 16/1/30.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSHomeListAction : MSActionGetBase


- (instancetype)initWithHomeListActionTime:(NSString *)timer offset:(NSNumber *)offset limit:(NSNumber *)numLimit;


@end
