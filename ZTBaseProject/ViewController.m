//
//  ViewController.m
//  ZTBaseProject
//
//  Created by FengLing on 16/3/10.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "ViewController.h"
#import "MSHttpActionMgr.h"

#import "ZTBaseProject-Swift.h"

#import "PWDView.h"
#import "TestAction.h"
#import "TestAction2.h"
#import "XMLLogout.h"
#import "XMLIsLogin.h"
#import "XMLLogin.h"
#import "MarkViewController.h"

@interface ViewController ()<PwdViewDelegate,NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTextfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@property (nonatomic,assign) NSInteger             viewDisplayCount;
@end

@implementation ViewController


-(BOOL) IsFirstTimeDisplay
{
    if( self.viewDisplayCount == 1 )
        return YES;
    return NO;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.phoneTextfield.text = [XMLStoreService phone];
    
    self.passwordTextfield.text = [XMLStoreService password];
    
  
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.viewDisplayCount += 1;
    if ([self IsFirstTimeDisplay]) {
        
        if (!self.phoneTextfield.text.length||!self.passwordTextfield.text.length) {
            return;
        }
        self.view.userInteractionEnabled = NO;
        [ZTUntil showHUDAddedTo:self.view];
        [[XMLIsLogin shared] Request:^(id obj, NSString *code, NSString *message) {
            [ZTUntil hideAllHUDsForView:self.view];
            self.view.userInteractionEnabled = YES;
            if ([code isEqualToString:@"0"]) {
                MarkViewController *login = [[MarkViewController alloc]initWithNibName:@"MarkViewController" bundle:nil];
                [self.navigationController pushViewController:login animated:YES];
            }else{
                [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
            }
            
        }];
    }

}

- (IBAction)logonClick:(id)sender{
    
    [ZTUntil showHUDAddedTo:self.view];
    
    [[XMLLogin shared] RequestWithPhone:self.phoneTextfield.text AndPassword:self.passwordTextfield.text Blocks:^(id obj, NSString *code, NSString *message) {
        [ZTUntil hideAllHUDsForView:self.view];
        if ([code isEqualToString:@"0"]) {
            
            [XMLStoreService Storephone:self.phoneTextfield.text];
            
            [XMLStoreService Storepassword:self.passwordTextfield.text];
            
            
            MarkViewController *login = [[MarkViewController alloc]initWithNibName:@"MarkViewController" bundle:nil];
            
            [self.navigationController pushViewController:login animated:YES];
            
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
