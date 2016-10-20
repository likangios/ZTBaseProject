//
//  LoginViewController.m
//  ZTBaseProject
//
//  Created by 哈哈哈 on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"  
#import "AccountListViewController.h"


#import "UserInfoModel.h"


#import "XMLEncryptStr.h"

#import "XMLUserLogin.h"



@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTextfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserInfoModel *model = [XMLStoreService userinfoWithMarkId:[NSString stringWithFormat:@"%ld",(long)self.markId]];
    
    self.phoneTextfield.text = model.account;
    self.passwordTextfield.text = model.password;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"账号" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}
- (void)rightBarButtonItemClick{
    
       __weak typeof(self) weakself = self;
    
    AccountListViewController *account = [[AccountListViewController alloc]initWithNibName:@"AccountListViewController" bundle:nil];
    account.markId = self.markId;
    
    [account setSelectAccount:^(UserInfoModel *model) {
        
        weakself.phoneTextfield.text = model.account;
        weakself.passwordTextfield.text = model.password;
    }];
    [self.navigationController pushViewController:account animated:YES];
}
- (IBAction)logonClick:(id)sender{
    
    UserInfoModel *model = [[UserInfoModel alloc]init];
    
    model.account = self.phoneTextfield.text;
    
    model.password = self.passwordTextfield.text;
    
    model.markId = [NSString stringWithFormat:@"%ld",self.markId];
    
    [XMLStoreService storeUserInfo:model WithMarkId:[NSString stringWithFormat:@"%ld",(long)self.markId]];
    
    [ZTUntil showHUDAddedTo:self.view];
    
    [[XMLEncryptStr shared] RequestWithName:self.phoneTextfield.text AndPassword:self.passwordTextfield.text MarkID:[NSString stringWithFormat:@"%ld",(long)self.markId] Blocks:^(id obj, NSString *code, NSString *message) {
        
        if ([code isEqualToString:@"0"]) {
            
            [[XMLUserLogin shared] RequestWithName:self.phoneTextfield.text AndPassword:self.passwordTextfield.text Blocks:^(id obj, NSString *code, NSString *message) {
                [ZTUntil hideAllHUDsForView:self.view];
                
                if (code) {
                    MainViewController *main = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
                    [self.navigationController pushViewController:main animated:YES];
                    [ZTUntil showErrorHUDViewAtView:self.view WithTitle:@"OK"];
                }else{
                    [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
                }
                
            }];
            
        }else{
            [ZTUntil hideAllHUDsForView:self.view];

            [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
