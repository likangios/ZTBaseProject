//
//  MSSearch.m
//  ms_sport
//
//  Created by FengLing on 16/2/23.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSSearch.h"

@implementation MSSearch

- (instancetype)initWithSearchKey:(NSString *)key{
    
    NSString *url = [NSString stringWithFormat:@"search.json?keyword=%@",[key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    self = [super initWithActionURLString:url];
    if (self) {
        
    }
    self.isValid = YES;
    return self;
}
@end
