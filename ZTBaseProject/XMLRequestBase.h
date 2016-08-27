//
//  XMLRequestBase.h
//  ZTBaseProject
//
//  Created by FengLing on 16/8/27.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlocks)(id obj , NSString *code , NSString *message);

@interface XMLRequestBase : NSObject<NSXMLParserDelegate>
{
    NSMutableString *mstrXMLString;  //用于存储元素标签的值

}
@property (nonatomic,strong) AFHTTPSessionManager               *httpMgr;

@property (nonatomic,strong) NSString               *code;

@property (nonatomic,strong) NSString               *message;

+(instancetype)shared;

@end
