//
//  MSSignoutAction.m
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSSignoutAction.h"

@implementation MSSignoutAction
- (instancetype)init{
    self = [super initWithActionURLString:@"users/sign_out.json"];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
