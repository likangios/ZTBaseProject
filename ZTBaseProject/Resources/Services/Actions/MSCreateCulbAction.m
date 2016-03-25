//
//  MSCreateCulbAction.m
//  ms_sport
//
//  Created by apple on 16/1/24.
//  Copyright © 2016年 ms_sport. All rights reserved.
//

#import "MSCreateCulbAction.h"

@implementation MSCreateCulbAction

- (id)initWithCreateCuleCulbName:(NSString *)culbName Culblocation:(NSString *)location CuleAddress:(NSString *)address city_Id:(NSString *)city_id party_price:(NSString *)party_price profile_image:(UIImage *)img{
    self = [super initWithActionURLString:@"clubs.json"];
    if (self) {
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:culbName,@"name",location,@"location",address,@"address",city_id,@"city_id",party_price,@"party_price", nil];
        
    }
    self.upload_image_param_name = @"profile_image";
    self.upload_image =  img;
    self.isValid = YES;
    return self;
}



@end
