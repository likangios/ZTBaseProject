//
//  XMLStoreService.h
//  ZTBaseProject
//
//  Created by FengLing on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>
//20160830135635378cn6565080014342093.22450170545
@interface XMLStoreService : NSObject

+ (NSString *)PINSCODE;
+ (void)StorePINSCODE:(NSString *)pinscode;

+ (NSString *)RETCODE;
+ (void)StoreRETCODE:(NSString *)string;

+ (NSString *)SESSIONID;
+ (void)StoreSESSIONID:(NSString *)string;

+ (NSString *)ENCRYPTION;
+ (void)StoreENCRYPTION:(NSString *)string;

+ (NSString *)RANDOM_KEY;
+ (void)StoreRANDOM_KEY:(NSString *)string;


+ (NSString *)phone;
+ (void)Storephone:(NSString *)string;

+ (NSString *)password;
+ (void)Storepassword:(NSString *)string;

+ (NSString *)account;
+ (void)Storeaccount:(NSString *)string;

+ (NSString *)mima;
+ (void)Storemima:(NSString *)string;

@end
