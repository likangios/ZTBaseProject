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
    self = [super initWithActionURLString:@"http://115.159.34.132:8010/game?cmd=sync&click=125&kill=1&token=e3d49e3e02a2c2f56cb70926a371a190"];
    if (self) {
        
    }
    self.isValid =YES;
    return self;
}
@end
