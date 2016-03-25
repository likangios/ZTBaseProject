//
//  MSConfirmCodeAction.h
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSActionBase.h"

typedef enum : NSUInteger {
    ZhuCe = 1,
    ZhaoHuiMM,
    YunYingShangZhuCe,
    KaiFaShangZhuCe,
    BangDingShouJi
} CodeType;


@interface MSConfirmCodeAction : MSActionPostBase
-(id) initWithPhoneNumber:(NSString *) phone_number andCodeType:(CodeType)type;
@end
