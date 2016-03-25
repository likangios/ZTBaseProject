//
//  MSConfirmCodeAction.m
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSConfirmCodeAction.h"


@implementation MSConfirmCodeAction
-(id) initWithPhoneNumber:(NSString *) phone_number andCodeType:(CodeType)type{
    self=[super initWithActionURLString:@"users/confirm_code.json"];
    if (self) {
        self.parameters  = [NSMutableDictionary dictionary];
                            
        [self.parameters setValue:phone_number forKey:@"phone_num"];
        
        [self.parameters setValue:[NSNumber numberWithInteger:type] forKey:@"type"];
        
#if defined(MS_DEVELOPMENT)
        [self.parameters setValue:@1 forKey:@"debug"];
        
#endif
    }
    self.isValid = YES;
    return self;
}
@end
