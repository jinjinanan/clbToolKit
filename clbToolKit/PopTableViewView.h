//
//  PopTableViewView.h
//  YiHao_Travel
//
//  Created by 陈林波 on 14/09/2017.
//  Copyright © 2017 易豪. All rights reserved.
//

#import <MMPopupView/MMPopupView.h>
@interface Config : NSObject

@property (nonatomic, assign) UITableViewStyle tableStyle;

@property (nonatomic, assign)CGSize tableSize;

@property (nonatomic, assign) NSInteger numberOfSections;

@property (nonatomic, copy) NSInteger (^setNumOfRows)(NSInteger section);

@property (nonatomic, copy) NSArray<NSString *> *nameOfCellClassAry;
@property (nonatomic, assign) BOOL isXib;

@property (nonatomic, copy) UITableViewCell *(^setTableViewCell)(UITableView *tableView,NSIndexPath *indexPath);

@property (nonatomic, copy) CGFloat (^setHeightForRow)(NSIndexPath *indexPath);

@property (nonatomic, copy) void (^setSelectedRow)(NSIndexPath *indexPath);

@property (nonatomic) UIEdgeInsets separatorInset;


@property (nonatomic, assign) MMPopupType popStyle;

@end

@interface PopTableViewView : MMPopupView

- (instancetype)initWithFrame:(CGRect)frame withConf:(Config *)config;



@end


