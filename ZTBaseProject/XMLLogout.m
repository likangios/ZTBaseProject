//
//  XMLLogout.m
//  ZTBaseProject
//
//  Created by FengLing on 16/8/27.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "XMLLogout.h"

@implementation XMLLogout

- (void)LogOut:(SuccessBlocks)block{
    
    NSString *url =  @"http://m.zongyihui.cn:30200/nuclear/communicateServlet";
    NSString *sessionID = @"5428432827563849862";
    
    NSString *bodyString=  [NSString stringWithFormat:@"<?xml version='1.0' encoding='GBK' standalone='yes'?><MEBS_MOBILE><REQ name='logout'><SESSIONID>%@</SESSIONID></REQ></MEBS_MOBILE>",sessionID];
    
    NSData *body = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    [self.httpMgr POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithHeaders:@{@"text/xml":@"Content-Type",[NSString stringWithFormat:@"%ld",body.length]:@"Content-Length"} body:body];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSXMLParser *xmlparser = responseObject;
        [xmlparser setDelegate:self];
        [xmlparser parse];
        
        block(nil,self.code,self.message);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      
        block(nil,@"-1",error.description);

    }];
    
    
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    [super parser:parser foundCharacters:string];
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
    
}
@end
