//
//  QYTableViewCell.h
//  CrossSlipTableView
//
//  Created by 鞠鑫 on 2018/3/14.
//  Copyright © 2018年 Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYTableViewCell : UITableViewCell

- (void) updateData:(NSMutableArray*)dataArray indexpath:(NSIndexPath*)indexPath;

@end
