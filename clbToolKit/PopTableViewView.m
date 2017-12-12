//
//  PopTableViewView.m
//  YiHao_Travel
//
//  Created by 陈林波 on 14/09/2017.
//  Copyright © 2017 易豪. All rights reserved.
//

#import "PopTableViewView.h"
#import "AppMacro.h"
#import <Masonry/Masonry.h>

@interface PopTableViewView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableV;
@property (nonatomic, strong) Config *conf;

@end

@implementation PopTableViewView

- (instancetype)initWithFrame:(CGRect)frame withConf:(Config *)config{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.conf = config;
        self.type = config.popStyle;
//        mWeakSelf
//        [self.attachedView bk_whenTapped:^{
//            [weakSelf hide];
//        }];
        [self configSubView:config];
    }
    return self;
}

-(void)configSubView:(Config *)config
{
    mWeakSelf
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:config.tableStyle];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.scrollEnabled = NO;
    [self.tableV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableV setSeparatorInset:self.conf.separatorInset];

    
    
    [self.conf.nameOfCellClassAry enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (weakSelf.conf.isXib)
        {
            [weakSelf.tableV registerNib:[UINib nibWithNibName:obj bundle:nil] forCellReuseIdentifier:obj];
        }
        else
        {
            [weakSelf.tableV registerClass:NSClassFromString(obj) forCellReuseIdentifier:obj];
        }
    }];
    
    [self addSubview:self.tableV];
    [self.tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(config.tableSize);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.tableV);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.conf.numberOfSections > 0) {
        return self.conf.numberOfSections;
    }
    else
    {
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.conf.setNumOfRows) {
        return self.conf.setNumOfRows(section);
    }
    else
    {
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.conf.setTableViewCell) {
        return self.conf.setTableViewCell(tableView,indexPath);
    }
    else
    {
        return [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.conf.setHeightForRow) {
        return self.conf.setHeightForRow(indexPath);
    }
    else
    {
        return 45;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.conf.setSelectedRow) {
        self.conf.setSelectedRow(indexPath);
    }
}

@end

@implementation Config

@end
