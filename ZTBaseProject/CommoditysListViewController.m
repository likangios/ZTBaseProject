//
//  CommoditysListViewController.m
//  ZTBaseProject
//
//  Created by FengLing on 16/9/30.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "CommoditysListViewController.h"
#import "CommodityModel.h"

@interface CommoditysListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) IBOutlet  UITableView                   *tableview;
@end

@implementation CommoditysListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.estimatedRowHeight = 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    CommodityModel *model = self.data[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@--%@--%@",model.name,model.minPrice,model.currentPrice,model.maxPrice];
    cell.textLabel.numberOfLines = 0;
    cell.detailTextLabel.text = model.code;
    return cell;
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
