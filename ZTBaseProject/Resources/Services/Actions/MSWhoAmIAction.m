//
//  MSWhoAmIAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/1/30.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSWhoAmIAction.h"

@implementation MSWhoAmIAction
-(instancetype)initWithWhoAmI{
    self = [super initWithActionURLString:@"users/whoami.json"];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
