//
//  UIView+Frame.m
//  模仿百思
//
//  Created by nick on 16/4/14.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setCh_x:(CGFloat)ch_x {
    CGRect frame = self.frame;
    frame.origin.x = ch_x;
    self.frame = frame;
}
- (CGFloat)ch_x {
    return self.frame.origin.x;
}

- (void)setCh_y:(CGFloat)ch_y {
    CGRect frame = self.frame;
    frame.origin.y = ch_y;
    self.frame = frame;
}
- (CGFloat)ch_y {
    return self.frame.origin.y;
}

- (void)setCh_width:(CGFloat)ch_width {
    CGRect frame = self.frame;
    frame.size.width = ch_width;
    self.frame = frame;
}
- (CGFloat)ch_width {
    return self.frame.size.width;
}

- (void)setCh_height:(CGFloat)ch_height {
    CGRect frame = self.frame;
    frame.size.height = ch_height;
    self.frame = frame;
}
- (CGFloat)ch_height {
    return self.frame.size.height;
}

- (void)setCh_centerX:(CGFloat)ch_centerX {
    CGPoint center = self.center;
    center.x = ch_centerX;
    self.center = center;
}
- (CGFloat)ch_centerX {
    return self.center.x;
}

- (void)setCh_centerY:(CGFloat)ch_centerY {
    CGPoint center = self.center;
    center.y = ch_centerY;
    self.center = center;
}
- (CGFloat)ch_centerY {
    return self.center.y;
}

@end
