//
//  QYicon.m
//  CrossSlipTableView
//
//  Created by 鞠鑫 on 2018/3/19.
//  Copyright © 2018年 Johnson. All rights reserved.
//

#import "QYicon.h"

@implementation QYicon
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self setImageEdgeInsets:UIEdgeInsetsMake(-40, 0, 0, -35)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -23, -50, 23)];
    return self;
}
@end
