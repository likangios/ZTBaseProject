//
//  MSUsersNearWithMeAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/17.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSUsersNearWithMeAction : MSActionPostBase
- (instancetype)initWithLocation:(NSString *)location sex:(NSString *)sex offset:(NSNumber *)offset limit:(NSNumber *)numLimit;
@end
