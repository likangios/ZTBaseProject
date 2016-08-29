//
//  XMLRequestBase.h
//  ZTBaseProject
//
//  Created by FengLing on 16/8/27.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SessionID @"SessionID"

#define PINSCODE  @"PINSCODE"

#define RETCODE   @"RETCODE"

#define DEVICEID   @"iE816009A-1483-4252-8EE0-6B6C12ABFC4D"
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
