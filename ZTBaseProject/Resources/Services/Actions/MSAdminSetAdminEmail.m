//
//  MSAdminSetAdminEmail.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/3/6.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSAdminSetAdminEmail.h"

@implementation MSAdminSetAdminEmail
-(instancetype)initWIthEmail:(NSString *)email{
    self = [super initWithActionURLString:@"admin/set_admin_email.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        self.parameters[@"email"] = email;
    }
    self.isValid = YES;
    return self;
}
@end
