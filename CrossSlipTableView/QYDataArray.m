//
//  QYDataArray.m
//  CrossSlipTableView
//
//  Created by 鞠鑫 on 2018/3/16.
//  Copyright © 2018年 Johnson. All rights reserved.
//

#import "QYDataArray.h"

@implementation QYDataArray
- (instancetype) init {
    self = [super init];
    self.myTitleArray = [[NSMutableArray alloc]init];
    self.myTitleArray = [NSMutableArray arrayWithObjects:@"影视",@"热播",@"资讯",@"阅读",@"游戏",@"音乐",@"体育",@"竞技",@"育儿",@"科技",@"教育",@"旅游", @"竞技",@"生活",@"娱乐",nil];
    
    self.contentInCellsDictionary =[NSMutableDictionary dictionary];
    self.contentInCellsDictionary[self.myTitleArray[0]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"0", @"精选",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[1]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"11", @"娱乐",nil],[[NSArray alloc]initWithObjects:@"7", @"演唱会",nil],[[NSArray alloc]initWithObjects:@"8", @"记录",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[2]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"12", @"竞技",nil],[[NSArray alloc]initWithObjects:@"13", @"影视",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[3]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"18", @"育儿",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[4]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"24", @"娱乐",nil],[[NSArray alloc]initWithObjects:@"25", @"音乐",nil],[[NSArray alloc]initWithObjects:@"26", @"育儿",nil],[[NSArray alloc]initWithObjects:@"27", @"竞技",nil],[[NSArray alloc]initWithObjects:@"28", @"精选",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[5]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"6", @"热播",nil],[[NSArray alloc]initWithObjects:@"1", @"影视",nil],[[NSArray alloc]initWithObjects:@"2", @"热播",nil],[[NSArray alloc]initWithObjects:@"3", @"育儿",nil],[[NSArray alloc]initWithObjects:@"4", @"阅读",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[6]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"6", @"科技",nil],[[NSArray alloc]initWithObjects:@"7", @"精选",nil],[[NSArray alloc]initWithObjects:@"8", @"育儿",nil],[[NSArray alloc]initWithObjects:@"9", @"竞技",nil],[[NSArray alloc]initWithObjects:@"10", @"音乐",nil],[[NSArray alloc]initWithObjects:@"11", @"教育",nil],[[NSArray alloc]initWithObjects:@"10", @"科技",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[7]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"12", @"育儿",nil],[[NSArray alloc]initWithObjects:@"13", @"育儿",nil],[[NSArray alloc]initWithObjects:@"14", @"旅游",nil],[[NSArray alloc]initWithObjects:@"15", @"资讯",nil],[[NSArray alloc]initWithObjects:@"15", @"精选",nil],[[NSArray alloc]initWithObjects:@"17", @"娱乐",nil],[[NSArray alloc]initWithObjects:@"2", @"竞技",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[8]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"18", @"精选",nil],[[NSArray alloc]initWithObjects:@"19", @"竞技",nil],[[NSArray alloc]initWithObjects:@"20", @"精选",nil],[[NSArray alloc]initWithObjects:@"21", @"育儿",nil],[[NSArray alloc]initWithObjects:@"22", @"精选",nil],[[NSArray alloc]initWithObjects:@"23", @"教育",nil],[[NSArray alloc]initWithObjects:@"26", @"育儿",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[9]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"0", @"娱乐",nil],[[NSArray alloc]initWithObjects:@"1", @"演唱会",nil],[[NSArray alloc]initWithObjects:@"2", @"记录",nil],[[NSArray alloc]initWithObjects:@"3", @"记录",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[10]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"24", @"科技",nil],[[NSArray alloc]initWithObjects:@"25", @"精选",nil],[[NSArray alloc]initWithObjects:@"26", @"音乐",nil],[[NSArray alloc]initWithObjects:@"27", @"音乐",nil],[[NSArray alloc]initWithObjects:@"28", @"竞技",nil],[[NSArray alloc]initWithObjects:@"5", @"精选",nil],[[NSArray alloc]initWithObjects:@"1", @"育儿",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[11]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"3", @"竞技",nil],[[NSArray alloc]initWithObjects:@"1", @"影视",nil],[[NSArray alloc]initWithObjects:@"2", @"娱乐",nil],[[NSArray alloc]initWithObjects:@"3", @"旅游",nil],[[NSArray alloc]initWithObjects:@"4", @"生活",nil],[[NSArray alloc]initWithObjects:@"5", @"资讯",nil],[[NSArray alloc]initWithObjects:@"25", @"旅游",nil],nil];
    self.contentInCellsDictionary[self.myTitleArray[12]] = [[NSMutableArray alloc]initWithObjects:[[NSArray alloc]initWithObjects:@"6", @"育儿",nil],[[NSArray alloc]initWithObjects:@"7", @"精选",nil],[[NSArray alloc]initWithObjects:@"8", @"阅读",nil],[[NSArray alloc]initWithObjects:@"9", @"资讯",nil],nil];
    
    return self;
}
@end
