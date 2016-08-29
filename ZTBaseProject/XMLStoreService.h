//
//  XMLStoreService.h
//  ZTBaseProject
//
//  Created by FengLing on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLStoreService : NSObject

+ (NSString *)PINSCODE;
+ (void)StorePINSCODE:(NSString *)pinscode;


+ (NSString *)RETCODE;
+ (void)StoreRETCODE:(NSString *)string;

@end
