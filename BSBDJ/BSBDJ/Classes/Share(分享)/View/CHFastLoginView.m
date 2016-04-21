//
//  CHFastLoginView.m
//  BSBDJ
//
//  Created by nick on 16/4/21.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHFastLoginView.h"

@implementation CHFastLoginView

+ (instancetype)FastLoginView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

@end
