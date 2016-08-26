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

@interface ViewController ()<PwdViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    NSString *urlString = BaseURLString;
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSString *value = @"<r_PM act=\"login\" loginname=\"1234\" password=\"12345678\" />";
    
    NSString *message = [value stringByReplacingOccurrencesOfString:@"[\\\"" withString:@""];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    [request setHTTPMethod: @"POST"];
    [request setValue:@"text/xml" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody:[[NSString stringWithFormat:@"%@",message] dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager alloc
    
    // Make sure to set the responseSerializer correctly
    operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSXMLParser *XMLParser = (NSXMLParser *)responseObject;
        [XMLParser setShouldProcessNamespaces:YES];
        
        // Leave these commented for now (you first need to add the delegate methods)
        XMLParser.delegate = self;
        [XMLParser parse];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    }];
    
    [operation start];

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
