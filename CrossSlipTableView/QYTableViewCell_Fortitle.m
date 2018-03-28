//
//  QYTableViewCell_Fortitle.m
//  CrossSlipTableView
//
//  Created by 鞠鑫 on 2018/3/14.
//  Copyright © 2018年 Johnson. All rights reserved.
//

#import "QYTableViewCell_Fortitle.h"

@interface QYTableViewCell_Fortitle()

@property (strong,nonatomic)UILabel*  titleInCell;
@end



@implementation QYTableViewCell_Fortitle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.titleInCell = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, 5, 100, 40)];
    self.titleInCell.textColor=[UIColor grayColor];
    self.titleInCell.font = [UIFont boldSystemFontOfSize:15];
    self.titleInCell.textAlignment = NSTextAlignmentCenter;
    UIView*  separatorLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];                //自定义cell分隔符
    separatorLineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.titleInCell];
    [self.contentView addSubview:separatorLineView];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    return self;
}

-(void) updateDate:(NSMutableArray*) dataArray indexPath:(NSIndexPath*)indexpath{
    [self.titleInCell setText:dataArray[indexpath.section]];
}

@end
