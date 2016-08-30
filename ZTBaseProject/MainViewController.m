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
{
    dispatch_queue_t queue;
}

@property (nonatomic,weak) IBOutlet  UIButton                   *btn1;
@property (nonatomic,weak) IBOutlet  UIButton                   *btn2;
@property (nonatomic,weak) IBOutlet  UIButton                   *btn3;
@property (nonatomic,weak) IBOutlet  UIButton                   *btn4;
@property (nonatomic,weak) IBOutlet  UIButton                   *btn5;


@property (nonatomic,weak) IBOutlet  UITextField                   *code1;
@property (nonatomic,weak) IBOutlet  UITextField                   *code2;
@property (nonatomic,weak) IBOutlet  UITextField                   *code3;
@property (nonatomic,weak) IBOutlet  UITextField                   *code4;
@property (nonatomic,weak) IBOutlet  UITextField                   *code5;


@property (nonatomic,weak) IBOutlet  UITextField                   *price1;
@property (nonatomic,weak) IBOutlet  UITextField                   *price2;
@property (nonatomic,weak) IBOutlet  UITextField                   *price3;
@property (nonatomic,weak) IBOutlet  UITextField                   *price4;
@property (nonatomic,weak) IBOutlet  UITextField                   *price5;

@property (nonatomic,weak) IBOutlet  UITextField                   *amount1;
@property (nonatomic,weak) IBOutlet  UITextField                   *amount2;
@property (nonatomic,weak) IBOutlet  UITextField                   *amount3;
@property (nonatomic,weak) IBOutlet  UITextField                   *amount4;
@property (nonatomic,weak) IBOutlet  UITextField                   *amount5;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    
}
- (IBAction)buttonClick:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    NSString *code;
    NSString *price;
    NSString *amount;
    
    switch (sender.tag) {
        case 1:
            code = self.code1.text;
            price=  self.price1.text;
            amount = self.amount1.text;
            break;
        case 2:
            code = self.code2.text;
            price=  self.price2.text;
            amount = self.amount2.text;
            break;
        case 3:
            code = self.code3.text;
            price=  self.price3.text;
            amount = self.amount3.text;
            break;
        case 4:
            code = self.code4.text;
            price=  self.price4.text;
            amount = self.amount4.text;
            break;
        case 5:
            code = self.code5.text;
            price=  self.price5.text;
            amount = self.amount5.text;
            break;
    }
    
    if (sender.selected) {
        
        [self startRequestWithIndex:sender.tag Code:code Price:price Amount:amount Count:1];
    }
}

- (void)startRequestWithIndex:(NSInteger)index Code:(NSString *)code Price:(NSString *)price Amount:(NSString *)amount Count:(NSInteger)count{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSTimeInterval  start  =  CACurrentMediaTime();
        
        [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:code Price:price Amount:amount Blocks:^(id obj, NSString *code, NSString *message) {
            NSTimeInterval end = CACurrentMediaTime();
            
            NSLog(@"code:%@  price:%@  amout :%@  time: %f",self.code1.text,self.price1,self.amount1,end-start);
            
            [self  updateUIWithIndex:index Code:code message:message Count:count];
            
        }];
        
    });
    
}
- (void)updateUIWithIndex:(NSInteger)index Code:(NSString *)code message:(NSString *)message Count:(NSInteger)count{
    
    if ([code isEqualToString:@"0"]) {
       

        
        
        
        
    }else{
        
        
        
    }
    
    
    
    
};


- (void)requestWithCode:(NSString *)code AndPrice:(NSString *)price amount:(NSString *)amount{
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSTimeInterval  start  =  CACurrentMediaTime();
        
        [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:code Price:price Amount:amount Blocks:^(id obj, NSString *code, NSString *message) {
            NSTimeInterval end = CACurrentMediaTime();
            
            NSLog(@"code:%@  price:%@  amout :%@  time: %f",code,price,amount,end-start);
            
            if ([code isEqualToString:@"0"]) {
                
                [ZTUntil showErrorHUDViewAtView:self.view WithTitle:@"ok"];
                
            }else{
                [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
            }
        }];
        
    });
    
   

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (int i = 0; i<10; i++) {
        
        NSString *amount = [NSString stringWithFormat:@"%d",i];
        
        [self requestWithCode:@"605005" AndPrice:@"52" amount:amount];
        
    }
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
