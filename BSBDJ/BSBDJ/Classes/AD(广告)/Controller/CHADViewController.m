//
//  CHADViewController.m
//  模仿百思
//
//  Created by nick on 16/4/14.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHADViewController.h"
#import <AFNetworking.h>
#import "CHADItem.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "CHTabBarController.h"

#define AD_code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface CHADViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

@property (weak, nonatomic) IBOutlet UIView *clearBottonView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

/** imageView*/
@property (nonatomic, weak) UIImageView *ADImageView;

/** 模型*/
@property (nonatomic, strong) CHADItem *item;

/** timer*/
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation CHADViewController

- (UIImageView *)ADImageView{
    
    if (_ADImageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _ADImageView = imageView;
        [self.clearBottonView addSubview:imageView];
        
        imageView.userInteractionEnabled = YES;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        
        [imageView addGestureRecognizer:tap];
        
    }
    return _ADImageView;
}
- (void)tap{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:[NSURL URLWithString:_item.ori_curl]]) {
        [app openURL:[NSURL URLWithString:_item.ori_curl]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //屏幕适配启动图片
    [self setupLaunchImage];
    
    //加载广告数据
    [self loadData_AD];
    
    //添加定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
}
- (void)timeChange{
    
    static int i = 3;
    
    if (i <= 0) {
        [self jumpVC];
    }
    
    i --;
    
    NSString *str = [NSString stringWithFormat:@"跳转(%zd)",i];
    [self.jumpBtn setTitle:str forState:UIControlStateNormal];
}
- (IBAction)jumpVC {
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [[ CHTabBarController alloc] init];
    
    [self.timer invalidate];
}

//加载数据
// 加载广告数据
- (void)loadData_AD
{
    // 请求数据 -> 查看接口文档 -> 测试接口有没有问题 -> 解析数据(w_picurl,ori_curl:广告界面跳转地址,w,h) arr = dict[@"ad"]
    
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 2.创建请求参数:字典
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = AD_code2;
    
    // 3.发送请求(get,post)
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
//        // 写成plist文件
//        [responseObject writeToFile:@"/Users/nick/Desktop/ad.plist" atomically:YES];
        
        // 解析数据 -> 写成plist文件 -> 字典转模型 -> 模型数据展示界面
        // 获取广告字典数据
        NSDictionary *adDict = [responseObject[@"ad"] firstObject];
        
        // 字典转模型
        _item = [CHADItem mj_objectWithKeyValues:adDict];
        
        // 防止除以0
        if (_item.w <= 0) return;
        
        // 展示界面
        CGFloat w = CHScreenW;
        CGFloat h = CHScreenW / _item.w * _item.h;
        self.ADImageView.frame = CGRectMake(0, 0, w, h);
        // 加载广告图片
        [self.ADImageView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 请求失败
        NSLog(@"%@",error);
        
    }];
    
}
//屏幕适配启动图片
- (void)setupLaunchImage{
    UIImage *image = [[UIImage alloc] init];
    if (iphone4) {
        image = [UIImage imageNamed:@"LaunchImage"];
    }
    if (iphone5) {
        image = [UIImage imageNamed:@"LaunchImage-568h"];
    }
    if (iphone6) {
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }
    if (iphone6S) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }
    self.launchImageView.image = image;
}
/*
 http://mobads.baidu.com/cpro/ui/mads.php? code2=phcqnauguhykfmrquanhmgn_iaubthfqmgksuarhiwdgulpxnz3vndtkqw08nau_i1y1p1rhmhwz5hb8nbul5hdknwrhta_qmvqvqhgguhi_py4mqhf1tvchmgky5h6hmypw5rfrhzuet1dgulnhuan85hchuy7s5hdhiywgujy3p1n3mwb1pvdlnvf-pyf4mhr4nyrvmwpbmhwbpjclpyfspht3uwm4fmplphykfh7sta-b5yrzpj6spvrdfhpdtwysfmkzuykemyfqnauguau95rnsnbfknbm1qhnkww6vpjujnbdkfwd1qhnsnbrsnhwkfywawiu9mlfqhbd_h70htv6qnhn1pauvmynqnjclnj0lnj0lnj0lnj0lnj0hthyqniuvujykfhkc5hrvnb3dfh7spyfqnw0srj64nbu9tjysfmub5hdhtzfeujdztlk_mgpcfmp85rnsnbfknbm1qhnkww6vpjujnbdkfwd1qhnsnbrsnhwkfywawiubnhfdnjd4rjnvpwykfh7stzu-twy1qw68nbuwuhydnhchiayqphdzfhqsmypgizbqniuythuytjd1uavxnz3vnzu9ijyzfh6qp1rsfmws5y-fpaq8uht_nbuymycqnau1ijykpjrsnhb3n1mvnhdkqwd4niuvmybqniu1uy3qwd-hqdfkhakhhnn_hr7fq7udq7pchzkhir3_ryqnqd7jfzkpirn_wdkhqdp5hikpfrb_fnc_nbwpqddrhzkdinchtvww5hnvpj0zqwndnhrvnbsdpwb4ri3kpw0kphmhmlnqph6lp1ndm1-wpydvnhkbraw9nju9phihmh9wmh6zrjrhtv7_5iu85hdhtvd15hdhtltqp1rsfh4etjyypw0spzuvuyyqn1mynjc8nwbvrjtdqjrvrhb4qwdvnjddpbuk5yrzpj6spvrdgvpstbu_my4btvp9tarqnam
 */
@end
