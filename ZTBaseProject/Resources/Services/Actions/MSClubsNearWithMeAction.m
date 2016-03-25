//
//  MSClubsNearWithMeAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/17.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSClubsNearWithMeAction.h"

@implementation MSClubsNearWithMeAction
- (instancetype)initWithLocation:(NSString *)location offset:(NSNumber *)offset limit:(NSNumber *)numLimit{
    
    self = [super initWithActionURLString:@"clubs/near_with_me.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:location,@"location",offset,@"offset",numLimit,@"limit",nil];
    }
    self.isValid = YES;
    return self;
    
}
@end
