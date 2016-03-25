//
//  PWDView.h
//  ZTBaseProject
//
//  Created by FengLing on 16/3/11.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PwdViewDelegate <NSObject>


@optional

- (void)close;

- (BOOL)ShouldResignFirstResponderWithInputPassword:(NSString *)pwd;

- (BOOL)ShouldShowErrorMessageWithInputPassword:(NSString *)pwd;

@end

@interface PWDView : UIView

@property (nonatomic,weak) id <PwdViewDelegate> delegate;

@property (nonatomic,copy) NSString *errorMessage;

@property (nonatomic,copy) UIColor *errorColor;

@end
