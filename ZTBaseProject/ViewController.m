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
#import "XMLLogout.h"
#import "XMLIsLogin.h"
#import "XMLLogin.h"
#import "LoginViewController.h"


@interface ViewController ()<PwdViewDelegate,NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTextfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    
//    [[XMLLogout shared] LogOut:^(id obj, NSString *code, NSString *message) {
//       
//        
//        NSLog(@"obj %@ code %@ message %@",obj,code,message);
//        
//    }];
    
//    [[XMLIsLogin shared] Request:^(id obj, NSString *code, NSString *message) {
//        
//        NSLog(@"XMLIsLogin %@ code %@ message %@",obj,code,message);
//    }];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.userInteractionEnabled = NO;
    
    [ZTUntil showHUDAddedTo:self.view];
    
    [[XMLIsLogin shared] Request:^(id obj, NSString *code, NSString *message) {
        [ZTUntil hideAllHUDsForView:self.view];
        self.view.userInteractionEnabled = YES;
        if ([code isEqualToString:@"0"]) {
            LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            [self.navigationController pushViewController:login animated:YES];
        }else{
            [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
        }

    }];
}

- (IBAction)logonClick:(id)sender{
    
    [ZTUntil showHUDAddedTo:self.view];
    
    [[XMLLogin shared] RequestWithPhone:self.phoneTextfield.text AndPassword:self.passwordTextfield.text Blocks:^(id obj, NSString *code, NSString *message) {
        [ZTUntil hideAllHUDsForView:self.view];
        if ([code isEqualToString:@"0"]) {
            
        }else{
            
            [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
        }
        
    }];
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
