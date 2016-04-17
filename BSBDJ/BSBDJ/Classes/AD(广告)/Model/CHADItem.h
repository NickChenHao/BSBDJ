//
//  CHADItem.h
//  模仿百思
//
//  Created by nick on 16/4/15.
//  Copyright © 2016年 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHADItem : NSObject
/** url*/
@property (nonatomic, strong) NSString *w_picurl;
/** 跳转url*/
@property (nonatomic, strong) NSString *ori_curl;
/** H*/
@property (nonatomic, assign) CGFloat h;
/** W*/
@property (nonatomic, assign) CGFloat w;

@end
