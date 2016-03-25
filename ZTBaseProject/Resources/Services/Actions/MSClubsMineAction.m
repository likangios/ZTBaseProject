//
//  MSClubsMineAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/16.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSClubsMineAction.h"

@implementation MSClubsMineAction
- (instancetype)initWithClubsMineListoffset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    self = [super initWithActionURLString:@"clubs/mine.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:offset,@"offset",numLimit,@"limit", nil];
    }
    
    self.isValid = YES;
    return self;
    
}
@end
