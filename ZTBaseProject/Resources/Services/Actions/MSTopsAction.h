//
//  MSTopsAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/9.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"
//typedef enum {
//    TopTypeSingle,
//    TopTypeDouble
//}topType;


@interface MSTopsAction : MSActionPostBase
- (instancetype)initWithTopType:(NSString *)type dateType:(NSString *)dateType;
@end
