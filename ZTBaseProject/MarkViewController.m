//
//  MarkViewController.m
//  ZTBaseProject
//
//  Created by FengLing on 16/8/31.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MarkViewController.h"
#import "LoginViewController.h"
#import "XMLStoreService.h"
#import "XMLTradeServerinfo.h"
#import "ZTUntil.h"
#import "TradModel.h"
@interface MarkViewController ()

@end

@implementation MarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"title";
    NSArray *ids =@[@64,@158,@1,@3,@10,
                    @4,@15,@19,@9,
                    @28,@30,@33,@34,
                    @37,@42,@43,@46,
                    @55,@57,@62,@67,
                    @69,@70,@76,@77,
                    @80,@83,@86,@87,
                    @89,@90,@91,@92,
                    @93,@94,@96,@97,
                    @99,@101,@104,@105,
                    @106,@107,@108,@109,
                    @110,@111,@112,@113,
                    @114,@115,@116,@117,
                    @118,@119,@122,@123,
                    @124,@125,@127,@128,
                    @129,@130,@133,@134,
                    @135,@136,@137,@138,
                    @139,@140,@141,@142,
                    @143,@144,@146,@147,
                    @149,@151,@2
                    ];
    NSArray *titles = @[@"中国艺交所",@"大圆普洱",@"南京文交所",@"南方钱币邮票",@"易商联合",
                        @"北交所福利特",@"香港人参",@"金马甲",@"华夏文交所",
                        @"华中文交所",@"中南邮票交易",@"江苏省文交所",@"当代文交所",
                        @"感知交易中心",@"上酒所",@"纪念章平台",@"东方文交所",
                        @"中融文化",@"华强文交中心",@"阿特多多",@"成都文交所",
                        @"南昌邮币卡",@"北酒所老酒",@"东北商品",@"广商所",
                        @"中艺所金属",@"华东林交所",@"青岛青西",@"河北邮币卡",
                        @"安贵交易平台",@"南商所",@"南方文化商品",@"金陵文交中心",
                        @"文房四宝平台",@"新华金交所",@"北文中心",@"大连乾元",
                        @"西南邮币卡",@"隆盛艺术品",@"永瑞文化",@"四川联合酒类",
                        @"广西邮币卡",@"蓝海文交",@"3.0收藏品",@"保利邮币卡",
                        @"东北大宗",@"山东鼎丰商品",@"中安文化",@"国版阿凡提",
                        @"纬德酒交中心",@"远洋恒利",@"黄河商品",@"上文申江",
                        @"国富人参",@"吉林人参",@"联合文化",@"鸿鹄商品",
                        @"安贵票证平台",@"金丝路评级",@"川商藏品中心",@"景德镇陶交所",
                        @"四川润通",@"大连新丝路",@"四川感知鼎坤",@"指南针发售",
                        @"中销文交所",@"弘山文化",@"大宝赢",@"华今交易中心",
                        @"贵州西南藏品",@"上艺所",@"中晟环球商品",@"湖北黄金屋",
                        @"山西邮币卡",@"华鼎文件中心",@"华夏购销汇",@"大交所邮币卡",
                        @"中文两岸",@"北文+山西",@"模拟环境"];
    
    NSInteger row = ceil(ids.count/4.0);
    
    CGFloat buttonW = ScreenWidth/4.0;
    
    CGFloat height =  40;
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(ScreenWidth, row * height +100);
    [self.view addSubview:scrollView];
    
    for (int i = 0; i< ids.count; i++) {
        
        NSNumber *obj = ids[i];
        UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = obj.intValue;
        button.backgroundColor = [UIColor grayColor];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTintColor:[UIColor whiteColor]];
        button.frame = CGRectMake(i%4*buttonW, i/4*height, buttonW, height);
        [scrollView addSubview:button];
        [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.borderColor = [UIColor purpleColor].CGColor;
        button.layer.borderWidth = 1.0;
        button.layer.cornerRadius = 8.0;
    }
    
    // Do any additional setup after loading the view from its nib.
}
- (void)buttonclick:(UIButton *)btn{
    
    [XMLStoreService  StoremarkId:[NSString stringWithFormat:@"%ld",btn.tag]];

    [ZTUntil showHUDAddedTo:self.view];
    [[XMLTradeServerinfo shared] RequestBlocks:^(id obj, NSString *code, NSString *message) {
    [ZTUntil hideAllHUDsForView:self.view];
        if ([code isEqualToString:@"0"]) {
            NSArray *array = (NSArray *)obj;
            TradModel *model = array[0];
            NSString *url = model.TradeUrl;
            [XMLStoreService StoreTRADEURL:url];
            [XMLStoreService storeTradeUrls:obj WithMarkId:[XMLStoreService markId]];
            
            LoginViewController *main = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            main.markId = btn.tag;
            [self.navigationController pushViewController:main animated:YES];
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

// In a storyboard-based application,@ you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
