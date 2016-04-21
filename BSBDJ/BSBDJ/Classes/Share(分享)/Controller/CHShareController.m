//
//  CHShareController.m
//  模仿百思
//
//  Created by nick on 16/4/14.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHShareController.h"
#import "CHLoginViewController.h"
@interface CHShareController ()

@end

@implementation CHShareController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBar];
}

- (void)setUpNavBar{
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] selImage:nil highImage:[UIImage imageWithOriImageName:@"friendsRecommentIcon-click"] target:self action:nil];
    
    self.navigationItem.title = @"关注";
}
- (IBAction)LoginBtn {
    CHLoginViewController *vc = [[CHLoginViewController alloc] init];
    
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

@end
