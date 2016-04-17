//
//  UIBarButtonItem+Item.m
//  BuDeJie
//
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)


+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //正常状态
    [btn setImage:image forState:UIControlStateNormal];
    //选中状态
    [btn setImage:selImage forState:UIControlStateSelected];
    //高亮状态
    [btn setImage:highImage forState:UIControlStateHighlighted];
    //自适应尺寸
    [btn sizeToFit];
    // 监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 解决导航条按钮 点击范围过大的问题
    UIView *btnView = [[UIView alloc] initWithFrame:btn.bounds];

    [btnView addSubview:btn];

    return [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
}
@end
