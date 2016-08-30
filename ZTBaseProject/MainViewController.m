//
//  MainViewController.m
//  ZTBaseProject
//
//  Created by 哈哈哈 on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MainViewController.h"
#import "XMLOrderSubmit.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}


- (void)requestWithCode:(NSString *)code AndPrice:(NSString *)price amount:(NSString *)amount{
    [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:code Price:price Amount:amount Blocks:^(id obj, NSString *code, NSString *message) {
        
        if ([code isEqualToString:@"0"]) {
            [ZTUntil showErrorHUDViewAtView:self.view WithTitle:@"ok"];
        }else{
            [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
        }
        NSLog(@"code %@ message  %@",code,message);
    }];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self requestWithCode:@"500100" AndPrice:@"0.01" amount:@"1"];
    
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
