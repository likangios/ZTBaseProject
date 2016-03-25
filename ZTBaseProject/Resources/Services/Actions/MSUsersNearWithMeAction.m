//
//  MSUsersNearWithMeAction.m
//  ms_sport
//
//  Created by 哈哈哈 on 16/2/17.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSUsersNearWithMeAction.h"

@implementation MSUsersNearWithMeAction
- (instancetype)initWithLocation:(NSString *)location sex:(NSString *)sex offset:(NSNumber *)offset limit:(NSNumber *)numLimit{

    self = [super initWithActionURLString:@"users/near_with_me.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:location,@"location",offset,@"offset",numLimit,@"limit",sex,@"sex",nil];
    }
    self.isValid = YES;
    return self;

}
@end
