//
//  CHTabBar.m
//  模仿百思
//
//  Created by nick on 16/4/14.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHTabBar.h"


@interface CHTabBar ()
/** plusBtn*/
@property (nonatomic, strong) UIButton *plusBtn;
@end
@implementation CHTabBar

- (UIButton *)plusBtn{
    if (_plusBtn == nil) {
        _plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_plusBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [_plusBtn sizeToFit];
        [self addSubview:_plusBtn];
    }
    return _plusBtn;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger count = self.items.count + 1;
    
    CGFloat tabBarBtnX = 0;
    CGFloat tabBArBtnY = 0;
    CGFloat tabBarBtnW = self.ch_width / count;
    CGFloat tabBarBtnH = self.ch_height;
    int i = 0;
    for (UIView *tabBarBtn in self.subviews) {
        if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            tabBarBtnX = i *tabBarBtnW;
            tabBarBtn.frame = CGRectMake(tabBarBtnX, tabBArBtnY, tabBarBtnW, tabBarBtnH);
            i ++;
        }
    }
    self.plusBtn.center = CGPointMake(self.ch_width * 0.5, self.ch_height * 0.5);
}

@end
