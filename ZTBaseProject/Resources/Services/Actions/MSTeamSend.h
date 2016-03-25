//
//  MSTeamSend.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/12.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSTeamSend : MSActionPostBase
-(instancetype)initWithUid:(NSString *)uid AndTeamName:(NSString *)team_name;
@end
