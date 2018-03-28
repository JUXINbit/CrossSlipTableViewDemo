//
//  QYScrollView.h
//  CrossSlipTableView
//
//  Created by 鞠鑫 on 2018/3/13.
//  Copyright © 2018年 Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#define  indexFortitlesInSlider           0
#define  indexForLocation                 1
#define  indexForStriationInSlider        2


@interface QYScrollViewController : UIViewController

- (void) setNumberOfElementsInSlider:(NSInteger)numberOfelements;          //设置slider中的元素个数
- (void) setSizeOfSlider:(CGSize)sizeOfSlider;                             //设置slider尺寸
- (void) updateData:(NSMutableArray*)dataArray;                            //设置slider中的元素内容
- (void) setContentOffsetOfScrollView:(CGPoint)newContentOffset;           //设置slider到新的位置
- (CGPoint) getContentOffset;                                              //获取当前slider的位置
- (NSMutableArray*) getallElementsInSlider;                                //获取slider中的所有元素
- (NSInteger) getLengthOfSlider;                                           //获取slider的总长度

@end
