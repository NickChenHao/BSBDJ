//
//  CHNewController.m
//  模仿百思
//
//  Created by nick on 16/4/14.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHNewController.h"
#import "CHSubTagController.h"
@interface CHNewController ()

@end

@implementation CHNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    [self setUpNavBar];
}
- (void)setUpNavBar{
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] selImage:nil highImage:[UIImage imageWithOriImageName:@"MainTagSubIconClick"] target:self action:@selector(clickBtn)];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

- (void)clickBtn{
    CHSubTagController *subTagVc = [[CHSubTagController alloc] init];
    
    [self.navigationController pushViewController:subTagVc animated:YES];
    
}





@end
