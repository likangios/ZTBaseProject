//
//  ViewController.m
//  ZTBaseProject
//
//  Created by FengLing on 16/3/10.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "ViewController.h"
#import "MSHttpActionMgr.h"

#import "PWDView.h"
#import "TestAction.h"
#import "TestAction2.h"

@interface ViewController ()<PwdViewDelegate,NSXMLParserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
}
- (IBAction)showPwdView:(id)sender{
  
  PWDView *pwd = [PWDView loadSelfWithNibOwner:self];
  pwd.delegate = self;
  pwd.frame = self.view.bounds;
  [self.view addSubview:pwd];
  //    [pwd mas_makeConstraints:^(MASConstraintMaker *make) {
  //        make.left.right.top.bottom.mas_equalTo(0);
  //    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self request];
}
- (void)request{
    NSString *urlString = @"http://123.59.9.211:16978/Issue4ariesMobileServer/communicateServlet";
    
    NSString *message = @"<?xml version='1.0' encoding='GBK' standalone='yes'?><MEBS_MOBILE><REQ name='holding_query'><U>cn65650800143</U><COMMODITY_ID></COMMODITY_ID><S_I>4947828739352262882</S_I></REQ></MEBS_MOBILE>";
    
    NSData *body = [message dataUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"body .length %ld",body.length);
    
    AFHTTPSessionManager *manager2 =[AFHTTPSessionManager manager];
    
    manager2.requestSerializer=  [AFHTTPRequestSerializer serializer];
    
    manager2.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    
    [securityPolicy setAllowInvalidCertificates:YES];
    
    [manager2 setSecurityPolicy:securityPolicy];
    
    manager2.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/xml", nil];
    
    [manager2 POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithHeaders:@{@"text/xml":@"Content-Type",[NSString stringWithFormat:@"%ld",body.length]:@"Content-Length"} body:body];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress %@",uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {

        NSXMLParser *xmlparser = responseObject;
        [xmlparser setDelegate:self];
        [xmlparser parse];
        
        NSLog(@"responseObject %@",responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error %@",error);
        
        
        
    }];
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    NSLog(@"elementName:%@,namespaceURI:%@,qName:%@,attributeDict:%@",elementName,namespaceURI,qName,attributeDict);
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    NSLog(@"string %@",string);
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    NSLog(@"----elementName:%@,namespaceURI:%@,qName:%@",elementName,namespaceURI,qName);
    
}

#pragma mark - delegate

- (BOOL)ShouldResignFirstResponderWithInputPassword:(NSString *)pwd{
  if ([pwd isEqualToString:@"123456"]) {
    return YES;
  }
  return NO;
}
- (BOOL)ShouldShowErrorMessageWithInputPassword:(NSString *)pwd{
  if ([pwd isEqualToString:@"123456"]) {
    return NO;
  }
  return YES;
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
