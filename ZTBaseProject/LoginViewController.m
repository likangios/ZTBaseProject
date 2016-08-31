//
//  LoginViewController.m
//  ZTBaseProject
//
//  Created by 哈哈哈 on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"  


#import "XMLEncryptStr.h"

#import "XMLUserLogin.h"



@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTextfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.phoneTextfield.text = [XMLStoreService account];
    
    self.passwordTextfield.text = [XMLStoreService mima];
    
}
/*
 <?xml version="1.0" encoding = "GBK"?><MEBS_MOBILE><REP name="user_login"><RESULT><RETCODE>-1003</RETCODE><MESSAGE>交易密码输入有误！剩余次数(29)</MESSAGE></RESULT></REP></MEBS_MOBILE>
 
 <?xml version="1.0" encoding = "GBK"?><MEBS_MOBILE><REP name="user_login"><RESULT><MODULE_ID>18</MODULE_ID><LAST_TIME>2016-08-30 13:56:34</LAST_TIME><LAST_IP>221.226.98.138</LAST_IP><CHG_PWD>0</CHG_PWD><NAME>cn65650800143</NAME><RANDOM_KEY>20160830140941332cn6565080014344939.21266724055</RANDOM_KEY><RETCODE>6490049714034916126</RETCODE></RESULT></REP></MEBS_MOBILE>
 */
- (IBAction)logonClick:(id)sender{
    
    [XMLStoreService Storeaccount:self.phoneTextfield.text];
    
    [XMLStoreService Storemima:self.passwordTextfield.text];
    
    [ZTUntil showHUDAddedTo:self.view];
    
    [[XMLEncryptStr shared] RequestWithName:self.phoneTextfield.text AndPassword:self.passwordTextfield.text MarkID:[NSString stringWithFormat:@"%ld",self.markId] Blocks:^(id obj, NSString *code, NSString *message) {
        [ZTUntil hideAllHUDsForView:self.view];
        
        if ([code isEqualToString:@"0"]) {
            
            [[XMLUserLogin shared] RequestWithName:self.phoneTextfield.text AndPassword:self.passwordTextfield.text Blocks:^(id obj, NSString *code, NSString *message) {
                if (code) {
                    MainViewController *main = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
                    [self.navigationController pushViewController:main animated:YES];
                    
                    [ZTUntil showErrorHUDViewAtView:self.view WithTitle:@"OK"];
                }else{
                    
                    [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
                }
            }];
            
        }else{
            
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
