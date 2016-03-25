//
//  MSScoresSingleConfirm.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/28.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSScoresSingleConfirm.h"

@implementation MSScoresSingleConfirm
- (instancetype)initWithScore_id:(NSString *)score_id{
    self = [super initWithActionURLString:@"scores/single/confirm.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionary];
        
        self.parameters[@"score_id"] = score_id;
    }
    self.isValid = YES;
    return self;
}
@end
