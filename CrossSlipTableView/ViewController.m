//
//  ViewController.m
//  CrossSlipTableView
//
//  Created by 鞠鑫 on 2018/3/13.
//  Copyright © 2018年 Johnson. All rights reserved.
//

#import "ViewController.h"
#import "QYScrollViewController.h"
#import "QYTableViewCell.h"
#import "QYTableViewCell_Fortitle.h"
#import "QYDataArray.h"

#define  numberOfelementsInSlider   12
#define  heighOfSlider              60
#define  columnsOficonInCell        3
#define  titleRowHeightInCell       50
#define  singleRowHeightInCell      150
#define  CellIdentifier_title       @"cellForTitle"
#define  CellIdentifier_icon        @"cellForicon"
#define  CellIdentifier_remainder   @"remainderCells"


@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) QYScrollViewController* sliderView;
@property (strong,nonatomic) QYDataArray*   dataArr;
@property (strong,nonatomic) UITableView*  tableView;
@property (strong,nonatomic) UIView*     headTitleViewOfEachSection;
@property (strong,nonatomic) UITableViewCell*  fristVisibleCellInTableView;

@end



@implementation ViewController

CGPoint contentOffset;
NSInteger sectionForTitle = 0;

- (void) viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [[QYDataArray alloc]init];
    self.fristVisibleCellInTableView = nil;
    [self createTheSliderView];
    [self createTableView];
    [self createHeadTitleViewOfEachSection];
    [self linkButtonsToEachCell];
    [self setInitialContentOffset];
}

- (void) createTheSliderView {
    self.sliderView = [[QYScrollViewController alloc]init];
    [self.sliderView setNumberOfElementsInSlider:numberOfelementsInSlider];
    [self.sliderView setSizeOfSlider:CGSizeMake([UIScreen mainScreen].bounds.size.width, heighOfSlider)];
    [self.sliderView updateData:self.dataArr.myTitleArray];
    self.sliderView.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:self.sliderView.view];
}

- (void) setInitialContentOffset {
    contentOffset = self.sliderView.getContentOffset;
}

- (void) createTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.sliderView.view addSubview:self.tableView];
}

- (void) createHeadTitleViewOfEachSection {
    self.headTitleViewOfEachSection = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    UILabel*  headTitle = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-40, 6, 100, 60)];
    headTitle.text = @"全部频道";
    headTitle.textColor = [UIColor blackColor];
    headTitle.font = [UIFont boldSystemFontOfSize:20];
    [self.headTitleViewOfEachSection addSubview:headTitle];
    [self.sliderView.view addSubview:self.headTitleViewOfEachSection];
}

- (void) linkButtonsToEachCell {
    for(NSInteger i=0;i<numberOfelementsInSlider;i++){
        [self.sliderView.getallElementsInSlider[i][indexFortitlesInSlider] addTarget:self action: @selector(scrollToCell:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void) scrollToCell:(UIButton*)myButton {
    NSIndexPath*  assignSection = [NSIndexPath indexPathForRow:0 inSection:myButton.tag];
    [self.tableView scrollToRowAtIndexPath:assignSection atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return numberOfelementsInSlider;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray* iconInThisCell = self.dataArr.contentInCellsDictionary[self.dataArr.myTitleArray[section]];
    NSInteger  rowOftitle = 1;
    NSInteger  remainder = iconInThisCell.count%columnsOficonInCell;
    NSInteger  numberOfRows = remainder ? iconInThisCell.count/columnsOficonInCell+rowOftitle+1 : iconInThisCell.count/columnsOficonInCell+rowOftitle;
    if(section == numberOfelementsInSlider-1){
        if(numberOfRows > ([UIScreen mainScreen].bounds.size.height/singleRowHeightInCell+1))
            return numberOfRows;
        else
            return [UIScreen mainScreen].bounds.size.height/singleRowHeightInCell+1;
    }
    return numberOfRows;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!indexPath.row)
        return titleRowHeightInCell;
    return singleRowHeightInCell;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    //获取对应section中的有效行数
    NSInteger  NumberOfRows = [self.dataArr.contentInCellsDictionary[self.dataArr.myTitleArray[indexPath.section]] count] % columnsOficonInCell ? [self.dataArr.contentInCellsDictionary[self.dataArr.myTitleArray[indexPath.section]] count]/columnsOficonInCell+1 : [self.dataArr.contentInCellsDictionary[self.dataArr.myTitleArray[indexPath.section]] count]/columnsOficonInCell;
    //最后的section除了有效cell之后的cell不需要填充数据
    if((indexPath.section == numberOfelementsInSlider-1) && (indexPath.row > NumberOfRows)){
        UITableViewCell* remainderCells = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier_remainder];
        return remainderCells;
    }
    
    if(indexPath.row){
        QYTableViewCell* myCell = nil;
        if(indexPath.row != NumberOfRows){
            myCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier_icon];
        }
        if(!myCell){
             myCell = [[QYTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier_icon];
        }
        [myCell updateData:self.dataArr.contentInCellsDictionary[self.dataArr.myTitleArray[indexPath.section]] indexpath:indexPath];
        return myCell;
    }else{
        QYTableViewCell_Fortitle* myCell_f = [tableView dequeueReusableCellWithIdentifier:CellIdentifier_title];
        if(!myCell_f){
             myCell_f = [[QYTableViewCell_Fortitle alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier_title];
        }
        [myCell_f updateDate:self.dataArr.myTitleArray indexPath:indexPath];
        return myCell_f;
    }
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if(sectionForTitle != [self.tableView indexPathsForVisibleRows].firstObject.section){
  
        [self.sliderView.getallElementsInSlider[sectionForTitle][indexFortitlesInSlider] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UILabel* label = self.sliderView.getallElementsInSlider[sectionForTitle][indexForStriationInSlider];
        label.layer.backgroundColor  = [UIColor clearColor].CGColor;
        sectionForTitle = [self.tableView indexPathsForVisibleRows].firstObject.section;
        [self.sliderView.getallElementsInSlider[sectionForTitle][indexFortitlesInSlider] setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        label = self.sliderView.getallElementsInSlider[sectionForTitle][indexForStriationInSlider];
        label.layer.backgroundColor  = [UIColor brownColor].CGColor;

        contentOffset.x = [self.sliderView.getallElementsInSlider[sectionForTitle][indexForLocation] integerValue] - self.view.frame.size.width/2;
        if(contentOffset.x > 0){
            if(contentOffset.x > self.sliderView.getLengthOfSlider - self.view.frame.size.width)
                contentOffset.x = self.sliderView.getLengthOfSlider - self.view.frame.size.width;
            [self.sliderView setContentOffsetOfScrollView:contentOffset];
        }else{
                contentOffset.x = 0;
            [self.sliderView setContentOffsetOfScrollView:contentOffset];
        }
    }
}

@end
