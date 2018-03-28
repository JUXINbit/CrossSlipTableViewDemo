//
//  QYScrollView.m
//  CrossSlipTableView
//
//  Created by 鞠鑫 on 2018/3/13.
//  Copyright © 2018年 Johnson. All rights reserved.
//

#import "QYScrollViewController.h"

#define  lengthOftitle               40
#define  lengthOfStriation           30
#define  heightOfStriation           4
#define  spacingBetweenTitles        80
#define  initialDistanceOfTitle      15
#define  initialDistanceOfStriation  20


@interface QYScrollViewController ()

@property NSInteger  numberOfElements;
@property NSInteger  widthOfSlider;
@property NSInteger  heightOfSlider;
@property (strong,nonatomic)NSMutableArray*   elementsInSliderArray;
@property (strong,nonatomic)NSMutableArray*  locDataArray;
@property (strong,nonatomic)UIScrollView*  scrollView;
@property (strong,nonatomic)UIView*     sliderView;

@end



@implementation QYScrollViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self createElementsInSliderArr];
    [self createSliderView];
    [self createScrollView];
    [self createTheSeparatorLineView];
    [self initializeTheSlider];
}

- (void) setNumberOfElementsInSlider:(NSInteger)numberOfelements {
    self.numberOfElements = numberOfelements;
}

- (void) setSizeOfSlider:(CGSize)sizeOfSlider {
    self.widthOfSlider = sizeOfSlider.width;
    self.heightOfSlider = sizeOfSlider.height;
}

- (void) updateData:(NSMutableArray*)dataArray{
    self.locDataArray = dataArray;
}

- (NSMutableArray*) createMessageArrayOfEachElements {
    NSMutableArray*  messageArrayOfEachButton = [[NSMutableArray alloc]init];
    UIButton* myButtonInSlider = nil;
    NSNumber* locationOfEachButton = nil;
    UILabel*  striationOfEachButton = nil;
    messageArrayOfEachButton = [NSMutableArray arrayWithObjects:myButtonInSlider,locationOfEachButton,striationOfEachButton, nil];
    return messageArrayOfEachButton;
}

- (void) createElementsInSliderArr {
    self.elementsInSliderArray = [[NSMutableArray alloc]init];
    for(NSInteger i=0;i<self.numberOfElements;i++){
        NSMutableArray* messageArrayOfEachelements = self.createMessageArrayOfEachElements;
        self.elementsInSliderArray[i] = messageArrayOfEachelements;
        messageArrayOfEachelements[indexFortitlesInSlider] = [[UIButton alloc]init];
        messageArrayOfEachelements[indexForLocation] = [NSNumber numberWithInt:0];
        messageArrayOfEachelements[indexForStriationInSlider] = [[UILabel alloc]init];
    }
}

- (void) createSliderView {
    self.sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, spacingBetweenTitles*(self.numberOfElements-1)+lengthOftitle+initialDistanceOfTitle*2, self.heightOfSlider)];
    UIButton* myButton  = nil;
    UILabel* myLabel = nil;
    for(NSInteger i=0;i<self.numberOfElements;i++){
        myButton = self.elementsInSliderArray[i][indexFortitlesInSlider];
        myButton.frame  = CGRectMake(i*spacingBetweenTitles+initialDistanceOfTitle, 0, lengthOftitle, self.heightOfSlider);
        myButton.tag = i;
        [myButton setTitle:self.locDataArray[i] forState:UIControlStateNormal];
        [myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        myButton.titleLabel.font=[UIFont systemFontOfSize:18];
        self.elementsInSliderArray[i][indexForLocation] = [NSNumber numberWithInt: (lengthOftitle/2+initialDistanceOfTitle+spacingBetweenTitles*i)];
        myLabel = self.elementsInSliderArray[i][indexForStriationInSlider];
        myLabel.frame = CGRectMake(i*spacingBetweenTitles+initialDistanceOfStriation, self.heightOfSlider-2*heightOfStriation, lengthOfStriation, heightOfStriation);
        myLabel.layer.cornerRadius = 3.0;
        [self.sliderView addSubview:myButton];
        [self.sliderView addSubview:myLabel];
    }
}

- (void) createScrollView {
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, lengthOftitle, self.widthOfSlider,self.heightOfSlider)];
    [self.scrollView setContentSize:CGSizeMake(spacingBetweenTitles*(self.numberOfElements-1)+lengthOftitle+initialDistanceOfTitle*2, self.heightOfSlider)];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    [self.scrollView addSubview:self.sliderView];
    [self.view addSubview:self.scrollView];
}

- (void) createTheSeparatorLineView {
    UIView* separatorLineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.heightOfSlider-1.5, spacingBetweenTitles*(self.numberOfElements-1)+lengthOftitle+initialDistanceOfTitle*2, 0.5)];
    separatorLineView.backgroundColor = [UIColor lightGrayColor];
    [self.sliderView addSubview:separatorLineView];
}

- (void) initializeTheSlider {
    UIButton* button = self.elementsInSliderArray[0][indexFortitlesInSlider];
    [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    UILabel* striation = self.elementsInSliderArray[0][indexForStriationInSlider];
    striation.layer.backgroundColor = [UIColor brownColor].CGColor;
}

- (CGPoint) getContentOffset {
    return self.scrollView.contentOffset;
}

- (void) setContentOffsetOfScrollView:(CGPoint)newContentOffset {
    [self.scrollView setContentOffset:newContentOffset animated:YES];
}

- (NSMutableArray*) getallElementsInSlider {
    assert(self.elementsInSliderArray);
    return self.elementsInSliderArray;
}

- (NSInteger) getLengthOfSlider {
    return spacingBetweenTitles*(self.numberOfElements-1)+lengthOftitle+initialDistanceOfTitle*2;
}

@end
