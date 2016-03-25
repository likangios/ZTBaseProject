//
//  MSCreateActivityAction.m
//  ms_sport
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSCreateActivityAction.h"

@implementation MSCreateActivityAction

- (id)initWithActivityName:(NSString *)ActivityName {
    self = [super initWithActionURLString:@"partys.json"];
    if (self) {
        
//        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:party_id,@"party_id", nil];
    
    }
    self.isValid = YES;
    return self;
    
}

@end
