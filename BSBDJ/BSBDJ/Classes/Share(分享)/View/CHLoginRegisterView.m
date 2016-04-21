//
//  CHLoginRegisterView.m
//  BSBDJ
//
//  Created by nick on 16/4/21.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHLoginRegisterView.h"

@implementation CHLoginRegisterView

+ (instancetype)LoginView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}
+ (instancetype)RegisterView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
