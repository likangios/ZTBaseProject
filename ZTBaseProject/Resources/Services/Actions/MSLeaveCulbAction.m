//
//  MSLeaveCulbAction.m
//  ms_sport
//
//  Created by apple on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSLeaveCulbAction.h"

@implementation MSLeaveCulbAction

- (id)initWithLeaveCulb_id:(NSString *)culb_id{
    self = [super initWithActionURLString:[NSString stringWithFormat:@"clubs/leave/%@.json",culb_id]];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:culb_id,@"club_id", nil];
    }
    self.isValid = YES;
    return self;
}


@end
