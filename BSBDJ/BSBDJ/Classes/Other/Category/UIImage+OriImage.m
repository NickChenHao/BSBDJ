//
//  UIImage+OriImage.m
//  01-彩票
//
//  Created by xiaomage on 16/3/4.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIImage+OriImage.h"

@implementation UIImage (OriImage)
+ (UIImage *)imageWithOriImageName:(NSString *)imageName {
    
    //加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}


@end
