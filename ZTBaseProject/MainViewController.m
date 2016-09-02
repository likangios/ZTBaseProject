//
//  MainViewController.m
//  ZTBaseProject
//
//  Created by 哈哈哈 on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MainViewController.h"
#import "XMLOrderSubmit.h"
#import <IHKeyboardAvoiding.h>

@interface MainViewController ()<UITextFieldDelegate>
{
    dispatch_queue_t queue;
}
@property (nonatomic,weak) IBOutlet  UITextField                   *startTime;

@property (nonatomic,weak) IBOutlet  UIActivityIndicatorView                   *Activity1;
@property (nonatomic,weak) IBOutlet  UIActivityIndicatorView                   *Activity2;
@property (nonatomic,weak) IBOutlet  UIActivityIndicatorView                   *Activity3;
@property (nonatomic,weak) IBOutlet  UIActivityIndicatorView                   *Activity4;
@property (nonatomic,weak) IBOutlet  UIActivityIndicatorView                   *Activity5;

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
    
//    [IHKeyboardAvoiding setAvoidingView:self.view withTriggerView:self.view];
    
    
}
- (BOOL)shouldStartWithStartTime:(NSString *)time{
    
    if (time.length != 6) {
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//        [ZTUntil showErrorHUDViewAtView:self.view WithTitle:@"时间格式错误"];
//        });
        return  NO;
    }
    NSString *startTime = time;
    
    
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateStyle:NSDateFormatterMediumStyle];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr1 = [formatter1 stringFromDate:now];
    NSArray *array=[dateStr1 componentsSeparatedByString:@" "];
//    NSArray *c    urrentTime=[[array objectAtIndex:1] componentsSeparatedByString:@":"];
    
    NSString *current = [[array objectAtIndex:1] stringByReplacingOccurrencesOfString:@":" withString:@""];
    
    if (current.integerValue >= startTime.integerValue) {
        return YES;
    }
    return NO;
}
- (void)requestWithIndex:(NSInteger)index WithRect:(BOOL)rect{
    
    NSString *code;
    NSString *price;
    NSString *amount;
    
    switch (index) {
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
    if (rect) {
        
        switch (index) {
            case 1:
                [self.Activity1 startAnimating];
                break;
            case 2:
                [self.Activity2 startAnimating];
                break;
            case 3:
                [self.Activity3 startAnimating];
                break;
            case 4:
                [self.Activity4 startAnimating];
                break;
            case 5:
                [self.Activity5 startAnimating];
                break;
        }
        [self startRequestWithIndex:index Code:code Price:price Amount:amount Count:1];
    }else{
        switch (index) {
            case 1:
                [self.Activity1 stopAnimating];
                break;
            case 2:
                [self.Activity2 stopAnimating];
                break;
            case 3:
                [self.Activity3 stopAnimating];
                break;
            case 4:
                [self.Activity4 stopAnimating];
                break;
            case 5:
                [self.Activity5 stopAnimating];
                break;
        }
    }

    
}
- (IBAction)buttonClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 1:
            if (!self.code1.text.length || !self.price1.text.length || !self.amount1.text.length) {
                return;
            }
            break;
        case 2:
            if (!self.code2.text.length || !self.price2.text.length || !self.amount2.text.length) {
                return;
            }
            break;
        case 3:
            if (!self.code3.text.length || !self.price3.text.length || !self.amount3.text.length) {
                return;
            }
            break;
        case 4:
            if (!self.code4.text.length || !self.price4.text.length || !self.amount4.text.length) {
                return;
            }
            break;
        case 5:
            if (!self.code5.text.length || !self.price5.text.length || !self.amount5.text.length) {
                return;
            }
            break;
    }
    
    sender.selected = !sender.selected;
    
    [self  requestWithIndex:sender.tag WithRect:sender.selected];
    
}

#pragma mark --
- (void)startRequestWithIndex:(NSInteger)index Code:(NSString *)codeid Price:(NSString *)price Amount:(NSString *)amount Count:(NSInteger)count{
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if (![self shouldStartWithStartTime:self.startTime.text]) {
            sleep(1);
            NSLog(@"还没开始");
            [self startRequestWithIndex:index Code:codeid Price:price Amount:amount Count:count];
            return;
        }else{
            NSLog(@"时间到了");
        }
        
        NSTimeInterval  start  =  CACurrentMediaTime();
        
        [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:codeid Price:price Amount:amount Blocks:^(id obj, NSString *code, NSString *message) {
            NSTimeInterval end = CACurrentMediaTime();
            
            NSLog(@"code:%@ message:%@ price:%@  amout :%@  time: %f  count:%ld",code,message,price,amount,end-start,count);
            
            [self  updateUIWithIndex:index Code:code message:message Count:count];
            
        }];
        
    });
    
}
- (void)updateUIWithIndex:(NSInteger)index Code:(NSString *)code message:(NSString *)message Count:(NSInteger)count{
    count ++;
    if ([code isEqualToString:@"0"]) {
        
        switch (index) {
            case 1:
                self.btn1.selected = NO;
                self.btn1.backgroundColor = [UIColor blueColor];
                
                break;
            case 2:
                self.btn2.selected = NO;
                self.btn2.backgroundColor = [UIColor blueColor];
                break;
            case 3:
                self.btn3.selected = NO;
                self.btn3.backgroundColor = [UIColor blueColor];
                break;
            case 4:
                self.btn4.selected = NO;
                self.btn4.backgroundColor = [UIColor blueColor];
                break;
            case 5:
                self.btn5.selected = NO;
                self.btn5.backgroundColor = [UIColor blueColor];
                break;

        }
        switch (index) {
            case 1:
                [self.Activity1 stopAnimating];
                break;
            case 2:
                [self.Activity2 stopAnimating];
                break;
            case 3:
                [self.Activity3 stopAnimating];
                break;
            case 4:
                [self.Activity4 stopAnimating];
                break;
            case 5:
                [self.Activity5 stopAnimating];
                break;
        }
        
    }else{
        
        
        switch (index) {
            case 1:
                [self uploadWithIndex:index Rect:self.btn1.selected Count:count];
                break;
            case 2:
                [self uploadWithIndex:index Rect:self.btn2.selected Count:count];

                break;
            case 3:
                [self uploadWithIndex:index Rect:self.btn3.selected Count:count];

                break;
            case 4:
                [self uploadWithIndex:index Rect:self.btn4.selected Count:count];

                break;
            case 5:
                [self uploadWithIndex:index Rect:self.btn5.selected Count:count];

                break;
                
        }
        
        
        
    }
    
    
    
    
};
- (void)uploadWithIndex:(NSInteger)index Rect:(BOOL)rect Count:(NSInteger)count{
   
    if (count > 100) {
        rect = NO;
    }
    NSString *code;
    NSString *price;
    NSString *amount;
    
    switch (index) {
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
    
    if (rect) {
        
        switch (index) {
            case 1:
                [self.Activity1 startAnimating];
                break;
            case 2:
                [self.Activity2 startAnimating];
                break;
            case 3:
                [self.Activity3 startAnimating];
                break;
            case 4:
                [self.Activity4 startAnimating];
                break;
            case 5:
                [self.Activity5 startAnimating];
                break;
        }
        [self startRequestWithIndex:index Code:code Price:price Amount:amount Count:count];
    }else{
        switch (index) {
            case 1:
                [self.Activity1 stopAnimating];
                break;
            case 2:
                [self.Activity2 stopAnimating];
                break;
            case 3:
                [self.Activity3 stopAnimating];
                break;
            case 4:
                [self.Activity4 stopAnimating];
                break;
            case 5:
                [self.Activity5 stopAnimating];
                break;
        }
    }
}


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
    
    [self.view endEditing:YES];
//    for (int i = 0; i<10; i++) {
//        
//        NSString *amount = [NSString stringWithFormat:@"%d",i];
//        
//        [self requestWithCode:@"605005" AndPrice:@"52" amount:amount];
//        
//    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [IHKeyboardAvoiding setAvoidingView:self.view withTriggerView:textField.superview];
    
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
