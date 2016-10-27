//
//  MainViewController.m
//  ZTBaseProject
//
//  Created by 哈哈哈 on 16/8/29.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MainViewController.h"
#import "OtherMainViewController.h"
#import "ResultOrder_SubmitModel.h"
#import "CommoditysListViewController.h"

#import "XMLOrderSubmit.h"
#import <IHKeyboardAvoiding.h>
#import "XMLSysTimeQuery.h"
#import "XMLUserLogin.h"
#import "XMLQueryCommodity.h"
#import "XMLUserLogoff.h"
#import "XMLOrderSubmitTest.h"
#import "XMLEncryptStrTest.h"
#import "XMLEncryptStr.h"


//model
#import "CommodityModel.h"
#import "TradModel.h"
static  NSDateFormatter *dateformatter (NSString *style){
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:style];
    return formatter;
}

@interface MainViewController ()<UITextFieldDelegate>
{
    dispatch_queue_t queue;
}
@property (nonatomic,weak) IBOutlet  UIButton                   *updateButton;
@property (nonatomic,strong) NSMutableArray               *queryData;
@property (nonatomic,assign) NSTimeInterval             shijiancha;
@property (nonatomic,strong) NSMutableArray *muArray;

@property (nonatomic,weak) IBOutlet UILabel     *logoLabel1;

@property (nonatomic,weak) IBOutlet UILabel     *logoLabel2;

@property (nonatomic,weak) IBOutlet UILabel     *logoLabel3;

@property (nonatomic,weak) IBOutlet UILabel     *logoLabel4;

@property (nonatomic,weak) IBOutlet UILabel     *logoLabel5;

@property (weak, nonatomic) IBOutlet UIButton *hahabutton;

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

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.btn1.selected = NO;
    self.btn2.selected = NO;
    self.btn3.selected = NO;
    self.btn4.selected = NO;
    self.btn5.selected = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSTimeInterval  start1  =  CACurrentMediaTime();
//    [self requestStart1:start1];
    
    _muArray = [NSMutableArray arrayWithCapacity:6];
    
    for (int i = 0; i<6; i++) {
        [_muArray addObject:@"logo"];
    }
    
    self.startTime.text = [XMLStoreService userdefaultValueWithKey:@"self.startTime"];
    
    self.code1.text = [XMLStoreService userdefaultValueWithKey:@"self.code1"];
    self.price1.text = [XMLStoreService userdefaultValueWithKey:@"self.price1"];
    self.amount1.text = [XMLStoreService userdefaultValueWithKey:@"self.amount1"];

    self.code2.text = [XMLStoreService userdefaultValueWithKey:@"self.code2"];
    self.price2.text = [XMLStoreService userdefaultValueWithKey:@"self.price2"];
    self.amount2.text = [XMLStoreService userdefaultValueWithKey:@"self.amount2"];
    
    self.code3.text = [XMLStoreService userdefaultValueWithKey:@"self.code3"];
    self.price3.text = [XMLStoreService userdefaultValueWithKey:@"self.price3"];
    self.amount3.text = [XMLStoreService userdefaultValueWithKey:@"self.amount3"];
    
    self.code4.text = [XMLStoreService userdefaultValueWithKey:@"self.code4"];
    self.price4.text = [XMLStoreService userdefaultValueWithKey:@"self.price4"];
    self.amount4.text = [XMLStoreService userdefaultValueWithKey:@"self.amount4"];
    
    self.code5.text = [XMLStoreService userdefaultValueWithKey:@"self.code5"];
    self.price5.text = [XMLStoreService userdefaultValueWithKey:@"self.price5"];
    self.amount5.text = [XMLStoreService userdefaultValueWithKey:@"self.amount5"];
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"other" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick)];
   
    self.updateButton.enabled = NO;
    NSTimeInterval  start  =  CACurrentMediaTime();
    NSDate *now1 = [NSDate date];
    NSLog(@"timeIntervalSince1970 %f",now1.timeIntervalSince1970);
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm:ss:SSS"];
    NSLog(@"formatter %@",[formatter stringFromDate:now1]);

    [[XMLSysTimeQuery shared] RequestWithSysTimeQueryBlocks:^(NSString *systime, NSString *code, NSString *message) {
        NSTimeInterval end = CACurrentMediaTime();
        NSDate *now = [NSDate date];
        NSTimeInterval requestTime = 1000/2.0*(end-start);
        self.shijiancha = now.timeIntervalSince1970*1000 - systime.doubleValue + requestTime;
        self.title = [NSString stringWithFormat:@"%.f+%.fms",self.shijiancha-requestTime,requestTime];
        NSLog(@"origin %.f   requestTime %.f ",self.shijiancha-requestTime,requestTime);
    }];
    
    [[XMLQueryCommodity shared] RequestQueryCommoditysBlocks:^(id obj, NSString *code, NSString *message) {
        
        if ([code isEqualToString:@"0"]) {
            self.updateButton.enabled = YES;

            _queryData = [NSMutableArray arrayWithArray:obj];
            
        }else{
            self.updateButton.enabled = NO;

            [ZTUntil showErrorHUDViewAtView:self.view WithTitle:message];
        }
        
    }];
    
//    NSArray *trads = [XMLStoreService getTradeUrlsWithMarkId:[XMLStoreService markId]];
//    for (TradModel *model in trads) {
//        [self test:model.TradeUrl];
//    }
    
    /*
    for (int i = 1; i<255; i++) {
            NSString *url = [NSString stringWithFormat:@"http://221.203.22.%d:16888/Issue4ariesMobileServer/communicateServlet",i];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1*0.5*i/2.0*NSEC_PER_SEC),dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

            NSTimeInterval  start  =  CACurrentMediaTime();
        
            [[XMLSysTimeQuery shared] RequestWithSysTimeQueryWithURL:url Blocks:^(id obj, NSString *code, NSString *message) {
                
                NSTimeInterval end = CACurrentMediaTime();
                NSLog(@"url:%@",url);
                if (![code isEqualToString:@"-1"]) {
                    NSLog(@"code:%@--message:%@__requestTime %.f ",code,message,1000*(end-start));
                }
            }];
        });

    }*/
    
    [XMLStoreService testStoreWithKeyChain:@"name1" password:@"1234561"];
    [XMLStoreService testStoreWithKeyChain:@"name2" password:@"1234562"];
    [XMLStoreService testStoreWithKeyChain:@"name3" password:@"1234563"];
    
    [XMLStoreService testStoreWithKeyChain:@"name1" password:@"1234561" AccessGroup:@"goup1"];
    [XMLStoreService testStoreWithKeyChain:@"name2" password:@"1234562" AccessGroup:@"goup1"];
    [XMLStoreService testStoreWithKeyChain:@"name3" password:@"1234563" AccessGroup:@"goup1"];
    
    NSArray *all = [XMLStoreService testGetAllItem];
    NSArray *group = [XMLStoreService testGetAllItemWithAccountGoup:@"goup1"];
    
//    NSLog(@"%@ === %@",all,group);
}
- (void)test:(NSString *)url{
    
    NSTimeInterval  start  =  CACurrentMediaTime();
    [[XMLSysTimeQuery shared] RequestWithSysTimeQueryWithURL:url Blocks:^(id obj, NSString *code, NSString *message) {
        NSTimeInterval end = CACurrentMediaTime();
        if (![code isEqualToString:@"-1"]) {
        NSLog(@"%@__requestTime %.f ",url,1000*(end-start));
        }
    }];
}
- (void)test2{
    
}
- (void)test3{
    
}
- (void)test4{
    
}
- (void)test5{
    
}

- (IBAction)updatePrice:(id)sender{
    
    [self setPriceWithcode];
}
- (void)setPriceWithcode{
    
    self.price1.text = [self getMaxPrice:self.code1.text];
    self.price2.text = [self getMaxPrice:self.code2.text];
    self.price3.text = [self getMaxPrice:self.code3.text];
    self.price4.text = [self getMaxPrice:self.code4.text];
    self.price5.text = [self getMaxPrice:self.code5.text];
    
}
- (CommodityModel *)getcommodityWithCode:(NSString *)code{
    
    for (CommodityModel *model in _queryData) {

        if ([model.code isEqualToString:code]) {
            return model;
        }
    }
    return nil;
}
- (NSString *)getMaxPrice:(NSString *)code{
    
    CommodityModel *model = [self getcommodityWithCode:code];
    
    return model.maxPrice;
    
}
#pragma mark --
- (void)startRequestWithIndex:(NSInteger)index Code:(NSString *)codeid Price:(NSString *)price Amount:(NSString *)amount Count:(NSInteger)count{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if (![self shouldStartWithStartTime:self.startTime.text]) {
            [NSThread sleepForTimeInterval:0.005];
            NSLog(@"还没开始");
            [self startRequestWithIndex:index Code:codeid Price:price Amount:amount Count:count];
            if (_muArray.count) {
                //            [_muArray removeObjectAtIndex:0];
            }
            //            [_muArray addObject:@"还没开始"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *string = @"";
                for (int i = 0; i<_muArray.count; i++) {
                    string  = [NSString stringWithFormat:@"%@\n%@",string,_muArray[i]];
                }
                
            });
            
            return;
        }else{
            
            NSLog(@"时间到了");
        }
        
        NSTimeInterval  start  =  CACurrentMediaTime();
        
        [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:codeid Price:price Amount:amount Blocks:^(ResultOrder_SubmitModel *result, NSString *code, NSString *message) {
            NSTimeInterval end = CACurrentMediaTime();
            
            NSLog(@"code:%@ message:%@ price:%@  amout :%@  time: %f  count:%ld",code,message,price,amount,end-start,count);

            [self  updateUIWithIndex:index Code:code message:message Count:count];
            
        }];
        
    });
    
}

- (BOOL)shouldStartWithStartTime:(NSString *)time{
    
    if (time.length != 9) {
        return  NO;
    }
    
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd "];
    NSString *dateStr1 = [formatter1 stringFromDate:now];
    
    [formatter1 setDateFormat:@"yyyy-MM-dd HHmmssSSS"];
    
    NSString *newTime = [NSString stringWithFormat:@"%@%@",dateStr1,time];
    
    NSDate *startDate = [formatter1 dateFromString:newTime];
    
    NSTimeInterval nowTimeInterval = now.timeIntervalSince1970;
    
    NSTimeInterval startTimeInterval = startDate.timeIntervalSince1970;
//    提前发起时间
    NSTimeInterval early = 50;
    
    if (nowTimeInterval*1000 >= startTimeInterval*1000 + self.shijiancha - early) {
        
        return YES;
    }
//    NSLog(@"time1  %f  time2 %f",nowTimeInterval *1000, startTimeInterval *1000+self.shijiancha);
    
    
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
- (IBAction)buttonClick1:(UIButton *)sender{
    
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
    
//    if (sender.tag == 1) {
//        if (sender.selected) {
//            [self queue1nstimer];
//        }
//    }
    
    if (sender.selected) {
        
        NSString *string = [NSString stringWithFormat:@"queue%ldnstimer",sender.tag];
        
        SEL selector = NSSelectorFromString(string);
        
        [self performSelector:selector withObject:nil afterDelay:0];
    }
}
static NSTimeInterval  tieminterval = 0.001;

static NSTimeInterval  nottieminterval = 0.001;

- (void)shouldRequestAgainWhenLongTime:(NSTimeInterval)start{
    
    
}
static int reloginCount = 0;

- (void)relogin{
    
    NSLog(@"重新登录");
    
    UserInfoModel *model = [XMLStoreService currentUserModel];
    
    [[XMLEncryptStr shared] RequestWithName:model.account AndPassword:model.password MarkID:model.markId Blocks:^(id obj, NSString *code, NSString *message) {
        
        NSLog(@"XMLEncryptStr code:%@ message:%@",code,message);
        if ([code isEqualToString:@"0"]) {
            [[XMLUserLogin shared] RequestWithName:model.account AndPassword:model.password Blocks:^(id obj, NSString *code, NSString *message) {
        NSLog(@"XMLUserLogin code:%@ message:%@",code,message);
                if (code) {

                }else{
                    if (reloginCount<5) {
                        reloginCount++;
                    [self relogin];
                    }else{
                        reloginCount = 0;
                    }
                }
                
            }];
            
        }else{
            
            
        }
    }];
}
- (void)requestStart1:(NSTimeInterval)startTime{
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(start1:) userInfo:@(startTime) repeats:YES];
    
}
- (void)start1:(NSTimer *)timer{
    
    NSTimeInterval currentTime = [NSDate  timeIntervalSinceReferenceDate];
    NSTimeInterval startTime = [(NSNumber *)timer.userInfo doubleValue];
    if (currentTime - startTime > 300) {
        NSLog(@"超市了");
    }
    NSLog(@"currentTime %.f  startTime %@",currentTime,timer.userInfo);
}
- (void)queue1nstimer{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.btn1.selected) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.Activity1 startAnimating];
            });
        if ([self shouldStartWithStartTime:self.startTime.text]) {
            NSTimeInterval  start  =  CACurrentMediaTime();
//            [self requestStart1:start];
            [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:self.code1.text Price:self.price1.text Amount:self.amount1.text Blocks:^(ResultOrder_SubmitModel *result, NSString *code, NSString *message) {
                NSTimeInterval end = CACurrentMediaTime();
                dispatch_async(dispatch_get_main_queue(), ^{
                [self.Activity1 stopAnimating];
                    
                self.logoLabel1.text = [NSString stringWithFormat:@"queue1 code :%@  message :%@ time : %f",code,message,end-start];
                });
                
                NSLog(@"queue1 code :%@  message :%@ time : %f",code,message,end-start);
                
                if ([code  isEqualToString:@"-1611"] ||[code  isEqualToString:@"-1633"]) {
                    [NSThread sleepForTimeInterval:tieminterval];
                    [self queue1nstimer];
                    
                }else if ([code isEqualToString:@"0"]){
                    NSLog(@"queue1 下单成功");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.logoLabel1.text = @"OK";
                        self.btn1.selected = NO;
                    });
                }else if ([code isEqualToString:@"-2"]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.logoLabel1.text = @"死了";
                    });
                    NSLog(@"queue1 你挂了");
                }else if ([code isEqualToString:@"-101"]){
                    [self relogin];
                }else{
                    [NSThread sleepForTimeInterval:tieminterval];
                    [self queue1nstimer];
                }
            }];
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
            self.logoLabel1.text = @"等。。。";
            });
            NSLog(@"queue1 时间不到");
            [NSThread sleepForTimeInterval:nottieminterval];
            [self queue1nstimer];
        }
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
//                self.logoLabel1.text = @"label";
                [self.Activity1 stopAnimating];
            });
        }
    });
}

- (void)queue2nstimer{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.btn2.selected) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.Activity2 startAnimating];
            });
            if ([self shouldStartWithStartTime:self.startTime.text]) {

                NSTimeInterval  start  =  CACurrentMediaTime();
                
                [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:self.code2.text Price:self.price2.text Amount:self.amount2.text Blocks:^(ResultOrder_SubmitModel *result, NSString *code, NSString *message) {
                    NSTimeInterval end = CACurrentMediaTime();
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.Activity2 stopAnimating];
                        
                        self.logoLabel2.text = [NSString stringWithFormat:@"queue2 code :%@  message :%@ time : %f",code,message,end-start];
                    });
                    
                    NSLog(@"queue2 code :%@  message :%@ time : %f",code,message,end-start);
                    
                    if ([code  isEqualToString:@"-1611"] ||[code  isEqualToString:@"-1633"]) {
                        [NSThread sleepForTimeInterval:tieminterval];

                        [self queue2nstimer];
                        
                    }else if ([code isEqualToString:@"0"]){
                        NSLog(@"queue2 下单成功");
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.logoLabel2.text = @"OK";
                            self.btn2.selected = NO;
                        });
                    }else if ([code isEqualToString:@"-2"]){
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.logoLabel2.text = @"死了";
                        });
                        NSLog(@"queue2 你挂了");
                    }else if ([code isEqualToString:@"-101"]){
                        [self relogin];
                    }else{
                        [NSThread sleepForTimeInterval:tieminterval];

                        [self queue2nstimer];
                    }
                }];
                
            }else{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.logoLabel2.text = @"等。。。";
                });
                NSLog(@"queue2 时间不到");
                [NSThread sleepForTimeInterval:nottieminterval];
                [self queue2nstimer];
            }
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
//                self.logoLabel2.text = @"label";
                [self.Activity2 stopAnimating];
            });
        }
    });
}

- (void)queue3nstimer{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.btn3.selected) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.Activity3 startAnimating];
            });
            if ([self shouldStartWithStartTime:self.startTime.text]) {

                NSTimeInterval  start  =  CACurrentMediaTime();
                
                [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:self.code3.text Price:self.price3.text Amount:self.amount3.text Blocks:^(ResultOrder_SubmitModel *result, NSString *code, NSString *message) {
                    NSTimeInterval end = CACurrentMediaTime();
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.Activity3 stopAnimating];
                        
                        self.logoLabel3.text = [NSString stringWithFormat:@"queue3 code :%@  message :%@ time : %f",code,message,end-start];
                    });
                    
                    NSLog(@"queue3 code :%@  message :%@ time : %f",code,message,end-start);

                    NSLog(@" :%@  message :%@",code,message);
                    
                    if ([code  isEqualToString:@"-1611"] ||[code  isEqualToString:@"-1633"]) {
                        [NSThread sleepForTimeInterval:tieminterval];
                        [self queue3nstimer];
                        
                    }else if ([code isEqualToString:@"0"]){
                        NSLog(@"queue3 下单成功");
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.logoLabel3.text = @"OK";
                            self.btn3.selected = NO;
                        });
                    }else if ([code isEqualToString:@"-2"]){
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.logoLabel3.text = @"死了";
                        });
                        NSLog(@"queue3 你挂了");
                    }else if ([code isEqualToString:@"-101"]){
                        [self relogin];
                    }else{
                        [NSThread sleepForTimeInterval:tieminterval];

                        [self queue3nstimer];
                    }
                }];
                
            }else{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.logoLabel3.text = @"等。。。";
                });
                NSLog(@"queue3 时间不到");
                [NSThread sleepForTimeInterval:nottieminterval];
                [self queue3nstimer];
            }
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
//                self.logoLabel3.text = @"label";
                [self.Activity3 stopAnimating];
            });
        }
    });
}
- (void)queue4nstimer{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.btn4.selected) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.Activity4 startAnimating];
            });
            if ([self shouldStartWithStartTime:self.startTime.text]) {

                NSTimeInterval  start  =  CACurrentMediaTime();
                
                [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:self.code4.text Price:self.price4.text Amount:self.amount4.text Blocks:^(ResultOrder_SubmitModel *result, NSString *code, NSString *message) {
                    NSTimeInterval end = CACurrentMediaTime();
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.Activity4 stopAnimating];
                        
                        self.logoLabel4.text = [NSString stringWithFormat:@"queue4 code :%@  message :%@ time : %f",code,message,end-start];
                    });
                    
                    NSLog(@"queue4 code :%@  message :%@ time : %f",code,message,end-start);
                    
                    if ([code  isEqualToString:@"-1611"] ||[code  isEqualToString:@"-1633"]) {
                        [NSThread sleepForTimeInterval:tieminterval];

                        [self queue4nstimer];
                        
                    }else if ([code isEqualToString:@"0"]){
                        NSLog(@"queue4 下单成功");
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.logoLabel4.text = @"OK";
                            self.btn4.selected = NO;
                        });
                    }else if ([code isEqualToString:@"-2"]){
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.logoLabel4.text = @"死了";
                        });
                        NSLog(@"queue4 你挂了");
                    }else if ([code isEqualToString:@"-101"]){
                        [self relogin];
                    }else{
                        [NSThread sleepForTimeInterval:tieminterval];

                        [self queue4nstimer];
                    }
                }];
                
            }else{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.logoLabel4.text = @"等。。。";
                });
                NSLog(@"queue4 时间不到");
                [NSThread sleepForTimeInterval:nottieminterval];
                [self queue4nstimer];
            }
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
//                self.logoLabel4.text = @"label";
                [self.Activity4 stopAnimating];
            });
        }
    });
}
- (void)queue5nstimer{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.btn5.selected) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.Activity5 startAnimating];
            });
            if ([self shouldStartWithStartTime:self.startTime.text]) {

                NSTimeInterval  start  =  CACurrentMediaTime();
                
                [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:self.code5.text Price:self.price5.text Amount:self.amount5.text Blocks:^(ResultOrder_SubmitModel *result, NSString *code, NSString *message) {
                    NSTimeInterval end = CACurrentMediaTime();
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.Activity5 stopAnimating];
                        
                        self.logoLabel5.text = [NSString stringWithFormat:@"queue5 code :%@  message :%@ time : %f",code,message,end-start];
                    });
                    
                    NSLog(@"queue5 code :%@  message :%@ time : %f",code,message,end-start);
                    
                    if ([code  isEqualToString:@"-1611"] ||[code  isEqualToString:@"-1633"]) {
                        [NSThread sleepForTimeInterval:tieminterval];

                        [self queue5nstimer];
                        
                    }else if ([code isEqualToString:@"0"]){
                        NSLog(@"queue5 下单成功");
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.logoLabel5.text = @"OK";
                            self.btn5.selected = NO;
                        });
                    }else if ([code isEqualToString:@"-2"]){
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.logoLabel5.text = @"死了";
                        });
                        self.btn5.selected = NO;
                        NSLog(@"queue5 你挂了");
                    }else if ([code isEqualToString:@"-101"]){
                        [self relogin];
                    }else{
                        [NSThread sleepForTimeInterval:tieminterval];

                        [self queue5nstimer];
                    }
                }];
                
            }else{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.logoLabel5.text = @"等。。。";
                });
                NSLog(@"queue5 时间不到");
                [NSThread sleepForTimeInterval:nottieminterval];
                [self queue5nstimer];
            }
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
//                self.logoLabel5.text = @"label";
                [self.Activity5 stopAnimating];
            });
        }
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
- (IBAction)TextFieldValueChange:(UITextField *)textfield{
    
    
    if (textfield == self.startTime) {
        
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.startTime"];
    }else if (textfield == self.code1){
        
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.code1"];
        
    }else if (textfield == self.code2){
        
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.code2"];
        
    }else if (textfield == self.code3){
        
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.code3"];
        
    }else if (textfield == self.code4){
        
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.code4"];
        
    }else if (textfield == self.code5){
        
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.code5"];
        
    }else if (textfield == self.price1){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.price1"];
        
    }else if (textfield == self.price2){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.price2"];
        
    }else if (textfield == self.price3){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.price3"];
        
    }else if (textfield == self.price4){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.price4"];
        
    }else if (textfield == self.price5){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.price5"];
        
    }else if(textfield == self.amount1){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.amount1"];
    }else if(textfield == self.amount2){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.amount2"];
    }else if(textfield == self.amount3){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.amount3"];
    }else if(textfield == self.amount4){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.amount4"];
    }else if(textfield == self.amount5){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.amount5"];
    }
    NSLog(@"text %@",textfield.text);
}

- (void)rightBarButtonItemClick{
   
    CommoditysListViewController *commoditys = [[CommoditysListViewController alloc]initWithNibName:@"CommoditysListViewController" bundle:nil];
//    OtherMainViewController *othermain = [[OtherMainViewController alloc]initWithNibName:@"OtherMainViewController" bundle:nil];
    commoditys.data = _queryData;
    [self.navigationController pushViewController:commoditys animated:YES];
    
}
- (IBAction)hahahahahah:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    sender.tag = 10;
//    [[XMLOrderSubmitTest shared] RequestWithBuy_Sell:@"1" commodityID:@"601001" Price:@"100" Amount:@"100" Blocks:^(id obj, NSString *code, NSString *message) {
//        NSLog(@"obj :%@ code: %@ message:%@",obj,code,message);
//
//        if (sender.selected) {
//            sender.selected = NO;
//            [self hahahahahah:sender];
//        }
//        
//    }];
    
    if (sender.selected) {
        for (int i = 0; i<1000; i++) {
        
        [self hahahahah];
        
        }
    }
}
- (void)hahahahah{
    
    UIButton *button = [self.view viewWithTag:10];
    
    if (!button.selected) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [[XMLEncryptStrTest shared] RequestWithName:@"12343234" AndPassword:@"124321" MarkID:@"1" Blocks:^(id obj, NSString *code, NSString *message) {
            
            NSLog(@"obj :%@ code: %@ message:%@",obj,code,message);
            
            [self hahahahah];
        }];
        
    });

 
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
