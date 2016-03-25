//
//  MSEditSelfAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/30.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSEditSelfAction : MSActionPostWithSingleImageBase

-(instancetype)initWithNickName:(NSString *)nickname  sign:(NSString *)sign profile_image:(UIImage *)image;
@end
