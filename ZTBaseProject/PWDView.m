//
//  PWDView.m
//  ZTBaseProject
//
//  Created by FengLing on 16/3/11.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "PWDView.h"
#import "CALayer+BLayerBorderColor.h"
@interface PWDView ()

@property (nonatomic,weak) IBOutlet UIView *mainView;

@property (nonatomic,weak) IBOutlet UIView *BorderView;

@property (nonatomic,weak) IBOutlet UILabel *errorLabel;

@property (nonatomic,strong) UITextField *textField;

@end

@implementation PWDView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self addObserver];
    [self addTextField];
//    [self animation];
}
- (void)setErrorColor:(UIColor *)errorColor{
    _errorColor = errorColor;
    _errorLabel.textColor = _errorColor;
}
- (void)setErrorMessage:(NSString *)errorMessage{
    _errorMessage = errorMessage;
    _errorLabel.text = _errorMessage;
}
#pragma mark - private

- (void)addTextField{
    _textField = [[UITextField alloc]initWithFrame:CGRectZero];
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    [_textField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_textField];
    [_textField becomeFirstResponder];
}
- (void)addObserver{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
#pragma mark - action

- (IBAction)close:(id)sender{
    
    [_textField resignFirstResponder];
    
}
#pragma mark  - notification
- (void)keyboardWillShow:(NSNotification *)notif {
    
    CGFloat duration = [[notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
   _mainView.transform = CGAffineTransformTranslate(_mainView.transform, 0, -100);
    } completion:NULL];
}
- (void)keyboardWillHide:(NSNotification *)notif {
    CGFloat duration = [[notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];

    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        _mainView.transform = CGAffineTransformTranslate(_mainView.transform, 0, 100);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - textFieldDelegate
- (void)textFieldChanged:(UITextField *)textField{
    textField.text = [textField.text substringToIndex:MIN(6, textField.text.length)];
    [self updateUI];
    if ([_delegate respondsToSelector:@selector(ShouldResignFirstResponderWithInputPassword:)]) {
        if ([_delegate ShouldResignFirstResponderWithInputPassword:textField.text]) {
            [_textField resignFirstResponder];
        }
    }
    if ([_delegate respondsToSelector:@selector(ShouldShowErrorMessageWithInputPassword:)]&&textField.text.length == 6) {
        _errorLabel.hidden = ![_delegate ShouldShowErrorMessageWithInputPassword:textField.text];
    }else{
        _errorLabel.hidden = YES;
    }
}
/**
 *  更新UI
 */
- (void)updateUI{
    for (int i =0 ; i<6; i++) {
        UIView *view = [_BorderView viewWithTag:i+1];
        UIView *blackview = [view viewWithTag:i+11];
        if (i<_textField.text.length) {
            blackview.hidden = NO;
        }else{
            blackview.hidden = YES;
        }
    }
}
-(void)animation
{
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 0.3;
    scaleAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.2],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0], nil];
    [_mainView.layer addAnimation:scaleAnimation forKey:@"transform.scale"];
    
    
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animation];
    bounceAnimation.duration = 0.3;
    bounceAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    bounceAnimation.values = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:0.01],
                              [NSNumber numberWithFloat:1.1],
                              [NSNumber numberWithFloat:0.9],
                              [NSNumber numberWithFloat:1.0],
                              nil];
    
    //    [_vAlert.layer addAnimation:bounceAnimation forKey:@"transform.scale"];
    
    CABasicAnimation *fadeInAnimation = [CABasicAnimation animation];
    fadeInAnimation.duration = 0.3;
    fadeInAnimation.fromValue = [NSNumber numberWithFloat:0];
    fadeInAnimation.toValue = [NSNumber numberWithFloat:1];
    [self.superview.layer addAnimation:fadeInAnimation forKey:@"opacity"];
    
}
#define mark - other

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
@end
