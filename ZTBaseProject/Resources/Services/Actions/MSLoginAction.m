//
//  MSLoginAction.m
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSLoginAction.h"

@implementation MSLoginAction
-(id) initWithPhoneNumber:(NSString *) phone_number
                 Password:(NSString *) password
{
    self = [super initWithActionURLString:@"users/sign_in.json"];
    if( self )
    {
        if( [phone_number length]  > 0 && [password length] > 0 )
        {
            self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                               phone_number , @"phone_num" ,
                               password , @"password",
                               @"iphone",@"device_type",
                               nil];
        }
    }
    self.isValid = YES;
    
    return self;
}

@end
