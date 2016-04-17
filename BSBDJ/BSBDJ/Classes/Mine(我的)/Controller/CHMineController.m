//
//  CHMineController.m
//  模仿百思
//
//  Created by nick on 16/4/14.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHMineController.h"

@interface CHMineController ()

@end

@implementation CHMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    [self setUpNavBar];
}
- (void)setUpNavBar{
    //右边
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] selImage:nil highImage:[UIImage imageWithOriImageName:@"mine-setting-icon-click"] target:self action:@selector(click)];
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selImage:[UIImage imageWithOriImageName:@"mine-sun-icon-click"] highImage:nil target:self action:@selector(select:)];
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    
    self.navigationItem.title = @"我的";
    
}

- (void)select:(UIButton *)btn{
    
    btn.selected = !btn.selected;
}

- (void)click{
//    SettingController *settingVC = [[SettingController alloc] init];
//    settingVC.hidesBottomBarWhenPushed = YES;
//    
//    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark - Table view data source


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

@end
