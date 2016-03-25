//
//  MSPartysMineAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/16.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSPartysMineAction : MSActionGetBase
- (instancetype)initWithPartysMineListoffset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
