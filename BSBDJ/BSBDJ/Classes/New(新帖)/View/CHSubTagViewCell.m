//
//  CHSubTagViewCell.m
//  模仿百思
//
//  Created by nick on 16/4/15.
//  Copyright © 2016年 nick. All rights reserved.
//

#import "CHSubTagViewCell.h"
#import <UIImageView+WebCache.h>
#import "CHSubTagItem.h"
@interface CHSubTagViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image_listView;
@property (weak, nonatomic) IBOutlet UILabel *theme_nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *sub_numberLabel;

@end
@implementation CHSubTagViewCell

- (void)setSubTagItem:(CHSubTagItem *)subTagItem{
    _subTagItem = subTagItem;
    
    [self.image_listView sd_setImageWithURL:[NSURL URLWithString:_subTagItem.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image == nil) return ;
        //裁剪图片
        self.image_listView.image = [image circleImage];
        
    }];
    
    
    self.theme_nameLabel.text = _subTagItem.theme_name;
    NSString *str = [NSString stringWithFormat:@"%@人订阅",_subTagItem.sub_number];
    
    NSInteger num = str.intValue;
    
    if (num > 10000) {
        CGFloat numF = num / 10000.0;
        str = [NSString stringWithFormat:@"%.1f人订阅",numF];
        str = [str stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    
    self.sub_numberLabel.text = str;
}
- (void)setFrame:(CGRect)frame{
    
    frame.size.height -= 1;
    [super setFrame:frame];
}
@end
