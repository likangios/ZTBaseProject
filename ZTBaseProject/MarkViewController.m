//
//  MarkViewController.m
//  ZTBaseProject
//
//  Created by FengLing on 16/8/31.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MarkViewController.h"
#import "LoginViewController.h"

@interface MarkViewController ()

@end

@implementation MarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"title";
    
    NSArray *ids =@[@64,@1,@3,@10,
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
    NSArray *titles = @[@"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@"",@"",
                        @"",@"",@""];
    
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
        [button setTitle:obj.stringValue forState:UIControlStateNormal];
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
    
    LoginViewController *main = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
   
    main.markId = btn.tag;
    
    [self.navigationController pushViewController:main animated:YES];
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
