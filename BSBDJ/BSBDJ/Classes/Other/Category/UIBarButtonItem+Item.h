//
//  UIBarButtonItem+Item.h
//  BuDeJie
//
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

/**
 *  设置导航条左右Item的View 为按钮时  可设置选中/高亮状态
 *
 *  @param image     正常状态下
 *  @param selImage  选中状态下
 *  @param highImage 高亮状态下
 *  @param target    监听者
 *  @param action    监听方法
 *
 *  @return          返回一个UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
@end
