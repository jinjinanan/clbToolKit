//
//  UIViewController+FreshHeaderAndFooter.h
//  YiHao_TB
//
//  Created by 陈林波 on 08/12/2017.
//  Copyright © 2017 YiHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

typedef void (^CLBRefreshingBlock)(void);

@interface UIViewController (FreshHeaderAndFooter)

-(MJRefreshNormalHeader *)table_header:(UITableView *)tv callBack:(CLBRefreshingBlock)refreshingBlock;

-(MJRefreshAutoNormalFooter *)table_footer:(UITableView *)tv callBack:(CLBRefreshingBlock)refreshingBlock;

-(void)setNavBarItem:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)tcolor withEvent:(SEL)action;

@end
