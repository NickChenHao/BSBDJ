//
//  CHTabBarController.m
//  模仿百思
//
//  Created by nick on 16/4/14.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHTabBarController.h"
#import "CHNavController.h"
#import "CHEssenceController.h"
#import "CHNewController.h"
#import "CHPublishController.h"
#import "CHShareController.h"
#import "CHMineController.h"

#import "CHTabBar.h"

@interface CHTabBarController ()

@end

@implementation CHTabBarController

+(void)initialize{
    
    //获得所有的tabBAr
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    //设置字体大小
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
    //设置选中时字体的颜色
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加所有子控制器
    [self setupAllChildrenController];
    
    //设置所有tabBar按钮
    [self setupTabBerButtoon];
    
    //自定义tabBar
    [self changeTabBar];
    
}

- (void)changeTabBar{
    //替换系统的tabBar
    CHTabBar *tabBar = [[CHTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}
//添加所有子控制器
- (void)setupAllChildrenController{
    //精华
    CHEssenceController *essenceVc = [[CHEssenceController alloc] init];
    CHNavController *navEssen = [[CHNavController alloc] initWithRootViewController:essenceVc];
    [self addChildViewController:navEssen];
    //新帖
    CHNewController *newVc = [[CHNewController alloc] init];
    CHNavController *navNew = [[CHNavController alloc] initWithRootViewController:newVc];
    [self addChildViewController:navNew];
    
//    CHPublishController *publishVc = [[CHPublishController alloc] init];
//    UINavigationController *navPublish = [[UINavigationController alloc] initWithRootViewController:publishVc];
//    [self addChildViewController:navPublish];
    
    //关注
    CHShareController *shareVc = [[CHShareController alloc] init];
    CHNavController *navShare = [[CHNavController alloc] initWithRootViewController:shareVc];
    [self addChildViewController:navShare];
    //我的
    CHMineController *mineVc = [[CHMineController alloc] init];
    CHNavController *navMine = [[CHNavController alloc] initWithRootViewController:mineVc];
    [self addChildViewController:navMine];
    
}

//设置所有tabBarButton
- (void)setupTabBerButtoon{
    CHNavController *navEssen = self.childViewControllers[0];
    navEssen.tabBarItem.title = @"精华";
    navEssen.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    navEssen.tabBarItem.selectedImage = [UIImage imageWithOriImageName:@"tabBar_essence_click_icon"];
    
    CHNavController *navNew = self.childViewControllers[1];
    navNew.tabBarItem.title = @"新帖";
    navNew.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    navNew.tabBarItem.selectedImage = [UIImage imageWithOriImageName:@"tabBar_new_click_icon"];
    
    CHNavController *navShare = self.childViewControllers[2];
    navShare.tabBarItem.title = @"分享";
    navShare.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    navShare.tabBarItem.selectedImage = [UIImage imageWithOriImageName:@"tabBar_friendTrends_click_icon"];
    
    CHNavController *navMine = self.childViewControllers[3];
    navMine.tabBarItem.title = @"我的";
    navMine.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    navMine.tabBarItem.selectedImage = [UIImage imageWithOriImageName:@"tabBar_me_click_icon"];
    
    
}
@end
