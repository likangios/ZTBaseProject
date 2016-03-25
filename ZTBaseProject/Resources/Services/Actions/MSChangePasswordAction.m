//
//  MSChangePasswordAction.m
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSChangePasswordAction.h"

@implementation MSChangePasswordAction

-(instancetype)initWithPhone:(NSString *)phone andToken:(NSString *)token andPWD:(NSString *)pwd{
    self = [super initWithActionURLString:@""];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        
        [self.parameters setValue:phone forKey:@"phone_num"];
        
        [self.parameters setValue:token forKey:@"token"];
        
        [self.parameters setValue:pwd forKey:@"pwd"];
        
    }
    self.isValid = YES;
    return self;
}
@end
