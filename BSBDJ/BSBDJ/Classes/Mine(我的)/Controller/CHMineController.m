//
//  CHMineController.m
//  模仿百思
//
//  Created by nick on 16/4/14.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHMineController.h"
#import <MJExtension.h>
#import "CHSquareItem.h"
#import "CHSquareCell.h"

static NSInteger const cols = 4;
static NSInteger const maginXY = 1;
#define itemWH (CHScreenW - (cols -1) * maginXY) / cols
@interface CHMineController ()<UICollectionViewDataSource>
/** 模型*/
@property (nonatomic, strong) NSMutableArray *squareItems;
/** collectionView*/
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation CHMineController

- (instancetype)init{
    return [[UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil] instantiateInitialViewController];
}
static NSString * ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置navBar
    [self setUpNavBar];
    
    //创建collectionView
    [self setupCollectionView];
    
    //设置数据
    [self loadData];
    
    self.automaticallyAdjustsScrollViewInsets = false;
    //设置额外滚动区域
    self.tableView.contentInset = UIEdgeInsetsMake(Magin - 35, 0, 0, 0);
    
    
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

}

- (void)setupCollectionView{
    //自定义流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    layout.minimumLineSpacing = maginXY;
    layout.minimumInteritemSpacing = maginXY;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    collectionView.backgroundColor = CHColor(215, 215, 215);
    
    self.tableView.tableFooterView = collectionView;
    
    collectionView.dataSource = self;
    _collectionView = collectionView;
    
    //注册
    [collectionView registerNib:[UINib nibWithNibName:@"CHSquareCell" bundle:nil] forCellWithReuseIdentifier:ID];
}
//请求数据
- (void)loadData{
    //设置请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"square";
    params[@"c"] = @"topic";
    //请求数据
    [CHHttpTool get_AFN:BaseURL params:params success:^(id responseObj) {
        
        // 字典数组
        NSArray *dictArr = responseObj[@"square_list"];
        
        _squareItems = [ CHSquareItem mj_objectArrayWithKeyValuesArray:dictArr];
        
        [self resolveData];
        
        //刷新collectionView
        [self.collectionView reloadData];
        
        //设置行数
        NSInteger count = self.squareItems.count;
        CGFloat rows = (count - 1) / cols + 1;
        //设置高度
        CGFloat height = rows * maginXY * (rows - 1) * itemWH;
        
        self.collectionView.ch_height = height;
        //让FooterView和collectinView高度一样
        self.tableView.tableFooterView = self.collectionView;
        //重新刷新tableView
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        CHLog(@"%@",error);
    }];
}
//补空格
- (void)resolveData{
    NSInteger count = self.squareItems.count;
    NSInteger extre = count % cols;
    if (extre) {
        extre = cols - extre;
        for (NSInteger i = 0; i < extre; i++) {
            CHSquareItem *item = [[CHSquareItem alloc] init];
            [self.squareItems addObject:item];
        }
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.squareItems.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CHSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.item = self.squareItems[indexPath.row];
    
    return cell;
}
@end
