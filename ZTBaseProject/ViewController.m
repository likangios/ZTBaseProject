//
//  ViewController.m
//  ZTBaseProject
//
//  Created by FengLing on 16/3/10.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "ViewController.h"

#import "PWDView.h"
#import "TestAction.h"
#import "TestAction2.h"

@interface ViewController ()<PwdViewDelegate>
{
    int _index;
}
@property (nonatomic,weak) IBOutlet  UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 4;
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(action) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)action{
    TestAction *action = [[TestAction alloc]init];
    [action DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
        NSLog(@"action %@",responseObject);
        NSDictionary *dic = (NSDictionary *)responseObject;
        self.label.text = dic.description;
        
    } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
        NSLog(@"error %@",error.description);
    }];
    
//    NSString *url = [NSString stringWithFormat:@"http://115.159.34.132:8010/game?cmd=remove&type=1&index=%d&token=e3d49e3e02a2c2f56cb70926a371a190",_index];
//    TestAction2 *action2 = [[TestAction2 alloc]initWithUrl:url];
//    [action2 DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
//        NSDictionary *dic = responseObject;
//        
//        if (dic[@"error"]) {
//            _index++;
//        }
//        NSLog(@"action2 %@",responseObject);
//        
//    } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
//        NSLog(@"error %@",error.description);
//    }];
}
- (IBAction)showPwdView:(id)sender{
    
    PWDView *pwd = [PWDView loadSelfWithNibOwner:self];
    pwd.delegate = self;
    pwd.frame = self.view.bounds;
    [self.view addSubview:pwd];
//    [pwd mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.bottom.mas_equalTo(0);
//    }];
}
#pragma mark - delegate 

- (BOOL)ShouldResignFirstResponderWithInputPassword:(NSString *)pwd{
    if ([pwd isEqualToString:@"123456"]) {
        return YES;
    }
    return NO;
}
- (BOOL)ShouldShowErrorMessageWithInputPassword:(NSString *)pwd{
    if ([pwd isEqualToString:@"123456"]) {
        return NO;
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
