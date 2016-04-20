//
//  CHSquareCell.m
//  BSBDJ
//
//  Created by nick on 16/4/20.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHSquareCell.h"
#import "CHSquareItem.h"
#import <UIImageView+WebCache.h>
@interface CHSquareCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation CHSquareCell

- (void)setItem:(CHSquareItem *)item{
    
    _item = item;
    
    // 给子控件赋值
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:item.icon]];
    _nameLabel.text = item.name;
}

@end
