//
//  UIImage+image.h
//  01-带有边框的圆形图片裁剪
//
//  Created by Gavin on 15/9/21.
//  Copyright (c) 2015年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

/**
 *  根据传入的图片,生成一终带有边框的圆形图片.
 *
 *  @param borderW 边框宽度
 *  @param color   边框颜色
 *  @param image   要生成的原始图片.
 *
 *  @return        返回一张带边框的图片
 */
+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)borderColor image:(UIImage *)image;



/**
 *  生成圆角图片
 *
 *  @return 返回一张圆角图片
 */
- (UIImage *)circleImage;
@end
