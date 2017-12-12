//
//  UIViewController+FreshHeaderAndFooter.m
//  YiHao_TB
//
//  Created by 陈林波 on 08/12/2017.
//  Copyright © 2017 YiHao. All rights reserved.
//

#import "UIViewController+FreshHeaderAndFooter.h"

@implementation UIViewController (FreshHeaderAndFooter)

-(MJRefreshNormalHeader *)table_header:(UITableView *)tv callBack:(CLBRefreshingBlock)refreshingBlock
{
    MJRefreshNormalHeader *table_header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];
    // 隐藏时间
    
    [table_header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [table_header setTitle:@"更新最新数据" forState:MJRefreshStatePulling];
    [table_header setTitle:@"正在刷新中..." forState:MJRefreshStateRefreshing];
    table_header.lastUpdatedTimeLabel.hidden = YES;
    tv.mj_header = table_header;
    return table_header;
}

-(MJRefreshAutoNormalFooter *)table_footer:(UITableView *)tv callBack:(CLBRefreshingBlock)refreshingBlock
{
    MJRefreshAutoNormalFooter *table_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshingBlock];
    [table_footer setTitle:@"" forState:MJRefreshStateIdle];
    [table_footer setTitle:@"正在加载更多 ..." forState:MJRefreshStateRefreshing];
    [table_footer setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
    tv.mj_footer = table_footer;
    return table_footer;
}

-(void)setNavBarItem:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)tcolor withEvent:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:font];
    [btn setTitleColor:tcolor forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itme = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItems = @[itme];
}


@end
