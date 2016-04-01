//
//  TestAction.m
//  ZTBaseProject
//
//  Created by FengLing on 16/3/25.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "TestAction.h"

@implementation TestAction
-(instancetype)init{
    self = [super initWithActionURLString:@"http://115.159.34.132:8010/game?cmd=sync&click=125&kill=0&token=c4aa3e45edbf9db4de62411211a7c33b"];
    if (self) {
        
    }
    self.isValid =YES;
    return self;
}
@end
