//
//  CHTextFieldColor.m
//  BSBDJ
//
//  Created by nick on 16/4/21.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHTextFieldColor.h"

@interface CHTextFieldColor ()

@end
@implementation CHTextFieldColor

- (void)awakeFromNib{
    //主题颜色
    self.tintColor = [UIColor whiteColor];
    //监听textF
    [self addTarget:self action:@selector(beginTextF) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(EndTextF) forControlEvents:UIControlEventEditingDidEnd];
    
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];

}

- (void)beginTextF{
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor whiteColor];
}
- (void)EndTextF{
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];
}
@end
