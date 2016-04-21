//
//  CHFastLogin.m
//  BSBDJ
//
//  Created by nick on 16/4/21.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHFastLogin.h"

@implementation CHFastLogin

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.ch_centerX = self.ch_width * 0.5;
    self.imageView.ch_y = 0;
    
    [self.titleLabel sizeToFit];
    self.titleLabel.ch_centerX = self.ch_width * 0.5;
    self.titleLabel.ch_y = self.ch_height - self.titleLabel.ch_height;
}

@end
