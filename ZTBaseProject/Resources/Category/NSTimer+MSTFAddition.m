//
//  NSTimer+MSTFAddition.m
//  ms_sport
//
//  Created by FengLing on 16/2/19.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "NSTimer+MSTFAddition.h"

@implementation NSTimer (MSTFAddition)
-(void)pauseTimer{
    if (self.isValid) {
        self.fireDate =[NSDate distantFuture];
    }

}
-(void)resumeTimer{
    self.fireDate =[NSDate date];
}
@end
