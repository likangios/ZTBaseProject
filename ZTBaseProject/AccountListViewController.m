//
//  AccountListViewController.m
//  ZTBaseProject
//
//  Created by FengLing on 16/9/27.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "AccountListViewController.h"
#import "XMLStoreService.h"
#import "UserInfoModel.h"

@interface AccountListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray               *accountData;

@property (nonatomic,weak) IBOutlet  UITableView                   *tableVeiw;

@end

@implementation AccountListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _accountData = [NSMutableArray arrayWithArray:[XMLStoreService userinfosWithMarkId:[NSString stringWithFormat:@"%ld",(long)self.markId]]];
    self.tableVeiw.tableFooterView = [UIView new];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _accountData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    UserInfoModel *model = _accountData[indexPath.row];
    
    cell.textLabel.text = model.account;
    
    cell.detailTextLabel.text = model.password;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserInfoModel *model = _accountData[indexPath.row];
    
    if (self.selectAccount) {
        self.selectAccount(model);
    }
    [self.navigationController popViewControllerAnimated:YES];
    
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
