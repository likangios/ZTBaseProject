//
//  OtherMainViewController.m
//  ZTBaseProject
//
//  Created by FengLing on 16/9/19.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "OtherMainViewController.h"
#import "XMLOrderSubmit.h"

@interface OtherMainViewController ()

@property (nonatomic,assign) NSInteger             requestCount;
@property (nonatomic,weak) IBOutlet  UITextField                   *code;

@property (nonatomic,weak) IBOutlet  UITextField                   *price;

@property (nonatomic,weak) IBOutlet  UITextField                   *amount;

@property (nonatomic,strong) NSMutableArray *muArray;

@property (nonatomic,weak) IBOutlet UILabel     *logoLabel;

@property (nonatomic,weak) IBOutlet  UIActivityIndicatorView                   *activityView;
@end

@implementation OtherMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _muArray = [NSMutableArray arrayWithCapacity:6];
    _requestCount = 0;
    for (int i = 0; i<6; i++) {
        [_muArray addObject:@" "];
    }
    self.code.text = [XMLStoreService userdefaultValueWithKey:@"self.code"];
    self.price.text = [XMLStoreService userdefaultValueWithKey:@"self.price"];
    self.amount.text = [XMLStoreService userdefaultValueWithKey:@"self.amount"];
}

- (IBAction)requestClick:(id)sender{
    [self.view endEditing:YES];
    [self.activityView startAnimating];
    
    NSTimeInterval  start  =  CACurrentMediaTime();
    
    [[XMLOrderSubmit shared] RequestWithBuy_Sell:@"1" commodityID:self.code.text Price:self.price.text Amount:self.amount.text Blocks:^(id obj, NSString *code, NSString *message) {
        [self.activityView stopAnimating];
        NSTimeInterval end = CACurrentMediaTime();
        
        NSLog(@"code:%@ message:%@ price:%@  amout :%@  time: %f  count:%ld",code,message,self.price.text,self.amount.text,end-start,_requestCount++);
        
        [_muArray removeObjectAtIndex:0];
        
        
        NSDate *now = [NSDate date];
        
        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
        
        [formatter1 setDateFormat:@"HH:mm:ss:SSS"];
        
        NSString *dateStr1 = [formatter1 stringFromDate:now];
        
        [_muArray addObject:[NSString stringWithFormat:@"time:%@ -耗时:%f--message:%@ -count:%ld",dateStr1,end-start,message,_requestCount]];
        
        NSString *string = @"";
        for (int i = 0; i<_muArray.count; i++) {
            string  = [NSString stringWithFormat:@"%@\n%@",string,_muArray[i]];
        }
        self.logoLabel.text= string;

    }];
    
}
- (IBAction)TextFieldValueChange:(UITextField *)textfield{
    
    
     if (textfield == self.code){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.code"];
        
    }else if (textfield == self.price){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.price"];
        
    }else if(textfield == self.amount){
        [XMLStoreService StoredefaultValue:textfield.text Key:@"self.amount"];
    }
    NSLog(@"text %@",textfield.text);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
