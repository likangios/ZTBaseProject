//
//  XMLStoreService.m
//  ZTBaseProject
//
//  Created by FengLing on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "XMLStoreService.h"
#import "UserInfoModel.h"

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
    
    return pinscode?:@"";
}

+ (void)StorePINSCODE:(NSString *)pinscode{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:pinscode forKey:@"PINSCODE"];
    [def  synchronize];
}

+ (NSString *)RETCODE{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"RETCODE"];
    return obj?:@"";
}
+ (void)StoreRETCODE:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"RETCODE"];
    [def  synchronize];
}


+ (NSString *)SESSIONID{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"SESSIONID"];
    return obj?:@"";
}
+ (void)StoreSESSIONID:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"SESSIONID"];
    [def  synchronize];
}
+ (NSString *)ENCRYPTION{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"ENCRYPTION"];
    return obj?:@"";
}
+ (void)StoreENCRYPTION:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"ENCRYPTION"];
    [def  synchronize];
}

+ (NSString *)RANDOM_KEY{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"RANDOM_KEY"];
    return obj?:@"";
}
+ (void)StoreRANDOM_KEY:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"RANDOM_KEY"];
    [def  synchronize];
}

+ (NSString *)TRADEURL{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"TRADEURL"];
    return obj?:@"";
}
+ (void)StoreTRADEURL:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"TRADEURL"];
    [def  synchronize];
}




+ (NSString *)phone{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"phone"];
    return obj?:@"";
}
+ (void)Storephone:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"phone"];
    [def  synchronize];
}

+ (NSString *)password{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"password"];
    return obj?:@"";
}
+ (void)Storepassword:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"password"];
    [def  synchronize];
}


+ (NSString *)account{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"account"];
    return obj?:@"";
}
+ (void)Storeaccount:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"account"];
    [def  synchronize];
}

+ (NSString *)mima{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"mima"];
    return obj?:@"";
}
+ (void)Storemima:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"mima"];
    [def  synchronize];
}
+ (NSString *)markId{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *obj = [def objectForKey:@"markId"];
    return obj?:@"";
}
+ (void)StoremarkId:(NSString *)string{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:string forKey:@"markId"];
    [def  synchronize];
}

+ (NSString *)getAccountWithMarkId:(NSString *)markId{
    return nil;
}

+ (void)storeAllAccoutWithMarkId:(NSString *)markId  Account:(NSString *)account PWD:(NSString *)password{
    NSDictionary *dic = @{@"":account,@"password":password};
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:dic forKey:markId];
    [def  synchronize];
}

+ (void)storeUserInfo:(UserInfoModel *)userinfo WithMarkId:(NSString *)markId{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userinfo];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:encodedObject forKey:markId];
    [userDefault synchronize];
}
+ (UserInfoModel *)userinfoWithMarkId:(NSString *)markId{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [userDefault objectForKey:markId];
    UserInfoModel *userinfo = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return userinfo;
}
@end
