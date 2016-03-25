//
//  MSHttpActionMgr.h
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  HTTP 管理器
 */
@interface MSHttpActionMgr : NSObject
/**
 *  单利
 *
 *  @return
 */
+(id)shared;
/**
 *  获取http操作管理器
 *
 *  @return
 */
- (AFHTTPSessionManager *)getHttpRequestMgr;
/**
 *  获取https操作管理器
 *
 *  @return
 */
- (AFHTTPSessionManager *)getHttpsRequestMgr;
/**
 *  清除缓存
 */
- (void)ClearCookies;
@end
