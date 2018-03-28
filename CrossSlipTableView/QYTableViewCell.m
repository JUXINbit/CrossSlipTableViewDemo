//
//  QYTableViewCell.m
//  CrossSlipTableView
//
//  Created by 鞠鑫 on 2018/3/14.
//  Copyright © 2018年 Johnson. All rights reserved.
//


#import "QYTableViewCell.h"
#import "QYicon.h"

#define  widthOfIcon               120
#define  heightOfIcon              120
#define  singleRowHeight           150
#define  pacingBetweenIcon         135
#define  indexOfLeftIcon (indexPath.row-1)*3
#define  indexOfMidIcon  (indexPath.row-1)*3+1
#define  indexOfRightIcon (indexPath.row-1)*3+2


@interface QYTableViewCell()

@property (strong,nonatomic)QYicon*  leftIcon;
@property (strong,nonatomic)QYicon*  midIcon;
@property (strong,nonatomic)QYicon*  rightIcon;

@end



@implementation QYTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.leftIcon = [[QYicon alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-pacingBetweenIcon*2-widthOfIcon)/2, (singleRowHeight-heightOfIcon)/2, widthOfIcon, heightOfIcon)];
    self.midIcon  = [[QYicon alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-pacingBetweenIcon*2-widthOfIcon)/2+pacingBetweenIcon, (singleRowHeight-heightOfIcon)/2, widthOfIcon, heightOfIcon)];
    self.rightIcon = [[QYicon alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-pacingBetweenIcon*2-widthOfIcon)/2+pacingBetweenIcon*2, (singleRowHeight-heightOfIcon)/2, widthOfIcon, heightOfIcon)];
    [self.contentView addSubview:self.leftIcon];
    [self.contentView addSubview:self.midIcon];
    [self.contentView addSubview:self.rightIcon];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    return self;
}

- (void) updateData:(NSMutableArray*)dataArray indexpath:(NSIndexPath*)indexPath{
    assert(dataArray);
    NSInteger numberOfIcons = dataArray.count;
    if(indexOfLeftIcon <= numberOfIcons-1){
        [self.leftIcon setImage:[UIImage imageNamed:dataArray[indexOfLeftIcon][0]] forState:UIControlStateNormal];
        [self.leftIcon setTitle:dataArray[indexOfLeftIcon][1] forState:UIControlStateNormal];
    }else{ return; }
    if(indexOfMidIcon <= numberOfIcons-1){
        [self.midIcon setImage:[UIImage imageNamed:dataArray[indexOfMidIcon][0]] forState:UIControlStateNormal];
        [self.midIcon setTitle:dataArray[indexOfMidIcon][1] forState:UIControlStateNormal];
    }else{ return; }
    if(indexOfRightIcon <= numberOfIcons-1){
        [self.rightIcon setImage:[UIImage imageNamed:dataArray[indexOfRightIcon][0]] forState:UIControlStateNormal];
        [self.rightIcon setTitle:dataArray[indexOfRightIcon][1] forState:UIControlStateNormal];
    }else{ return; }
}
@end
