//
//  MSVerficationCodeAction.h
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/23.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSActionBase.h"

@interface MSVerficationCodeAction : MSActionPostBase
- (instancetype)initWithPhoneNum:(NSString *)phone_num code:(NSString *)code;
@end
