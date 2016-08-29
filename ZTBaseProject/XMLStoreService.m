//
//  XMLStoreService.m
//  ZTBaseProject
//
//  Created by FengLing on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "XMLStoreService.h"

@implementation XMLStoreService
+(instancetype)shared{
    static id _sharedInstance=  nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc]init];
    });
    return _sharedInstance;
}
+ (NSString *)PINSCODE{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *pinscode = [def objectForKey:@"PINSCODE"];
    return pinscode;
}

+ (void)StorePINSCODE:(NSString *)pinscode{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:pinscode forKey:@"PINSCODE"];
    [def  synchronize];
}

+ (NSString *)RETCODE{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"RETCODE"];
    return obj;
}
+ (void)StoreRETCODE:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"RETCODE"];
    [def  synchronize];
}
@end
