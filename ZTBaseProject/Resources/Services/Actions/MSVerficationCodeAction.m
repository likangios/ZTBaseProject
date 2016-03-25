//
//  MSVerficationCodeAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/23.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSVerficationCodeAction.h"

@implementation MSVerficationCodeAction
- (instancetype)initWithPhoneNum:(NSString *)phone_num code:(NSString *)code {
    self = [super initWithActionURLString:@"users/verification_code.json"];
    if (self) {
        
        self.parameters = [NSMutableDictionary dictionary];
        
        [self.parameters setValue:phone_num forKey:@"phone_num"];
        
        [self.parameters setValue:code forKey:@"code"];
        
        
#if defined(MS_DEVELOPMENT)
        [self.parameters setValue:@1 forKey:@"debug"];
        
#endif
    }
    self.isValid = YES;
    return self;
}
@end
