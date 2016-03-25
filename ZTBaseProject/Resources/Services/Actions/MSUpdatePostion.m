//
//  MSUpdatePostion.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/17.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSUpdatePostion.h"

@implementation MSUpdatePostion
- (instancetype)initUpdatePostionWithLocation:(NSString *)location{
    
    self = [super initWithActionURLString:@"users/update_postion.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:location,@"location",nil];
    }
    self.isValid = YES;
    return self;
    
}
@end
