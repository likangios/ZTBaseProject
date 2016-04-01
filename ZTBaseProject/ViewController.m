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
  int _shazhisou;
  int _bugshouji;
  
}
@property (nonatomic,weak) IBOutlet  UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _shazhisou = 0;
  _bugshouji = 0;
  [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(action) userInfo:nil repeats:YES];
  
  NSTimer *timer  = [NSTimer scheduledTimerWithTimeInterval:2*60*60+60 target:self selector:@selector(yaoqing) userInfo:nil repeats:YES];
  [timer fire];
  
}
- (void)action{
  TestAction *action = [[TestAction alloc]init];
  [action DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
    NSLog(@"action %@",responseObject);
    NSDictionary *dic = (NSDictionary *)responseObject;
    self.label.text = dic.description;
    if (dic[@"error"]) {
      NSLog(@"失效");
      [self keeplive];
    }
    
  } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
    NSLog(@"error %@",error.description);
  }];
  
  //    NSString *url = [NSString stringWithFormat:@"http://115.159.34.132:8010/game?cmd=remove&type=1&index=%d&token=e3d49e3e02a2c2f56cb70926a371a190",_shazhisou];
  
  //    shazhisou
  NSString *url = @"http://115.159.48.85:8000/game?cmd=zhiSou&type=2&token=c4aa3e45edbf9db4de62411211a7c33b";
  
  TestAction2 *action2 = [[TestAction2 alloc]initWithUrl:url];
  [action2 DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
    NSDictionary *dic = responseObject;
    if (!dic[@"error"]) {
      _shazhisou++;
      NSNumber  *blitz = dic[@"blitz"];
      if (blitz.intValue<3) {
        [self bugshandian];
      }
      NSLog(@" shaleyigezhisou %@",responseObject);
    }
    NSLog(@"_shazhisou is %d",_shazhisou);
    
  } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
    NSLog(@"error %@",error.description);
  }];
  
//  NSString *url2 = @"http://115.159.48.85:8000/game?cmd=buyBuild&count=1&index=12&token=c4aa3e45edbf9db4de62411211a7c33b";
//  TestAction2 *action3 = [[TestAction2 alloc]initWithUrl:url2];
//  [action3 DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
//    NSDictionary *dic = responseObject;
//    if (!dic[@"error"]) {
//      
//      _bugshouji++;
//    }
//    NSLog(@"_bugshouji is %d",_bugshouji);
//    
//  } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
//    NSLog(@"error %@",error.description);
//  }];
}
- (void)bugshandian{
  NSString *url  = @"http://115.159.34.132:8011/game?cmd=buyBlitz&token=c4aa3e45edbf9db4de62411211a7c33b";
  
  TestAction2 *action2 = [[TestAction2 alloc]initWithUrl:url];
  [action2 DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
    NSLog(@"maiyigeshandian  %@",responseObject);
  } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
    NSLog(@"error %@",error.description);
  }];
}
- (void)keeplive{
  
  NSString *url = @"http://115.159.48.85:8000/game?cmd=keepLive&token=c4aa3e45edbf9db4de62411211a7c33b";
  TestAction2 *action2 = [[TestAction2 alloc]initWithUrl:url];
  [action2 DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
    NSLog(@"激活");
    
  } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
    NSLog(@"error %@",error.description);
  }];
}
- (void)yaoqing{
  NSString *url = @"http://115.159.48.85:8001/game?cmd=share&token=c4aa3e45edbf9db4de62411211a7c33b";
    TestAction2 *action2 = [[TestAction2 alloc]initWithUrl:url];
  [action2 DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
    NSLog(@"邀请----%@",responseObject);
    
  } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
    NSLog(@"error %@",error.description);
  }];
  
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
