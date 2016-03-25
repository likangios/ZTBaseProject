//
//  MSCreateCulbAction.h
//  ms_sport
//
//  Created by apple on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"
//创建俱乐部

@interface MSCreateCulbAction : MSActionPostWithSingleImageBase

- (id)initWithCreateCuleCulbName:(NSString *)culbName Culblocation:(NSString *)location CuleAddress:(NSString *)address city_Id:(NSString *)city_id party_price:(NSString *)party_price profile_image:(UIImage *)img;



@end
