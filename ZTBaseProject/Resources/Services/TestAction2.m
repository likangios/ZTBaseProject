//
//  TestAction2.m
//  ZTBaseProject
//
//  Created by FengLing on 16/3/25.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "TestAction2.h"

@implementation TestAction2

- (instancetype)initWithUrl:(NSString *)url{
    self = [super initWithActionURLString:url];
    self.isValid = YES;
    return self;
}
@end
