//
//  CHLoginViewController.m
//  BSBDJ
//
//  Created by nick on 16/4/21.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHLoginViewController.h"
#import "CHLoginRegisterView.h"
#import "CHFastLoginView.h"
@interface CHLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginRegisterView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadCons;
@property (weak, nonatomic) IBOutlet UIView *FastView;

@end

@implementation CHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //登录
    CHLoginRegisterView *loginView = [CHLoginRegisterView LoginView];
    [self.loginRegisterView addSubview:loginView];
    //注册
    CHLoginRegisterView *registerView = [CHLoginRegisterView RegisterView];
    [self.loginRegisterView addSubview:registerView];
    
    CHFastLoginView *fastView = [CHFastLoginView FastLoginView];
    [self.FastView addSubview:fastView];
    
}
//布局子控件的尺寸
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CHLoginRegisterView *loginView = self.loginRegisterView.subviews[0];
    loginView.frame = CGRectMake(0, 0, self.loginRegisterView.ch_width * 0.5 , self.loginRegisterView.ch_height);
    
    CHLoginRegisterView *registerView = self.loginRegisterView.subviews[1];
    registerView.frame = CGRectMake(self.loginRegisterView.ch_width * 0.5, 0, self.loginRegisterView.ch_width * 0.5, self.loginRegisterView.ch_height);
    
    CHFastLoginView *fastView = self.FastView.subviews[0];
    fastView.frame = CGRectMake(0, 0, self.FastView.ch_width, self.FastView.ch_height);
}
//返回
- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//登录注册按钮
- (IBAction)registerBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.leadCons.constant = self.leadCons.constant == 0 ? -CHScreenW : 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
