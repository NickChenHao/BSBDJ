//
//  CHSubTagController.m
//  模仿百思
//
//  Created by nick on 16/4/15.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHSubTagController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "CHSubTagItem.h"
#import <SVProgressHUD.h>
#import "CHSubTagViewCell.h"
static NSString *ID = @"cell";
@interface CHSubTagController ()
/** 模型*/
@property (nonatomic, strong) NSMutableArray *subTagArr;
/** task*/
@property (nonatomic, weak) NSURLSessionDataTask *task;
@end

@implementation CHSubTagController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //请求数据
    [self loadData_subTag];
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CHSubTagViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = CHColor(215, 215, 215);
}
- (void)viewWillDisappear:(BOOL)animated{
    
    [SVProgressHUD dismiss];
    
    [_task cancel];
}

- (void)loadData_subTag{
    
    //创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"c"] = @"topic";
    parameters[@"action"] = @"sub";
    
    [SVProgressHUD showWithStatus:@"正在加载..."];
    
   _task = [manager GET:BaseURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
        //取消提示
        [SVProgressHUD dismiss];
        
        _subTagArr = [CHSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        
    }];
    
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.subTagArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CHSubTagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    CHSubTagItem *subTagItem = self.subTagArr[indexPath.row];
    
    cell.subTagItem = subTagItem;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

@end
