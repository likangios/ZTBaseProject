//
//  MSActionBase.h
//  MS
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSHttpActionMgr.h"
#import "MSResponeResult.h"
@class MSActionBase;

#pragma mark  回调 Blocks
typedef void(^ActionSuccessBlock)(MSActionBase *action,id responseObject,NSURLSessionDataTask *operation);

typedef void(^ActionFailureBlock)(MSActionBase *action,NSError *error,NSURLSessionDataTask *operation);
/**
 *  请求基类
 */
@interface MSActionBase : NSObject

@property (nonatomic,strong)NSMutableDictionary *parameters;

@property (nonatomic,assign)    BOOL    isValid;

/**
 *  初始化一个请求
 *
 *  @param str_url 接口名字
 *
 *  @return id
 */
- (id)initWithActionURLString:(NSString *)str_url;
/**
 *  获取 URL
 *
 *  @return
 */
- (NSString *)get_action_url;
/**
 *  发请求
 *
 *  @param success 成功blocks
 *  @param failure 失败blocks
 *
 *  @return 
 */
- (BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure;

@end
#pragma  mark  GET
/**
 *  get 请求基类 所有get 请求都基于此类
 */
@interface MSActionGetBase : MSActionBase

@end
#pragma  mark  POST
/**
 *  post 请求基类 所有post 请求都基于此类
 */
@interface MSActionPostBase : MSActionBase

@end
#pragma  mark  DELETE

/**
 *  delete 请求基类 所有delete 请求都基于此类
 */
@interface MSActionDeleteBase : MSActionBase

@end
#pragma  mark  POST upload image

/**
 *  http post 动作并且能够上传一张图片
 */
@interface MSActionPostWithSingleImageBase : MSActionBase
/**
 *  要上传的图片名字 不填 使用默认 photo
 */
@property (nonatomic,retain) NSString * upload_image_param_name;
/**
 *  要上传的图片 必须要传
 */
@property (nonatomic,retain) UIImage * upload_image;
/**
 *  图片最大尺寸限制 可以不设置 没有限制
 */
@property (nonatomic,assign) CGSize    upload_image_max_size;

@end

@interface MSActionXMLBase : MSActionBase

@end

@interface MSActionXMLGet : MSActionXMLBase

@end

@interface MSActionXMLPost : MSActionXMLBase

@end
