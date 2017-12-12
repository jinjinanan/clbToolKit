//
//  ViewController.m
//  clbToolKitDemo
//
//  Created by 陈林波 on 14/09/2017.
//  Copyright © 2017 clb. All rights reserved.
//

#import "ViewController.h"
#import "QuartzViewController.h"
#import "MMPopVC.h"
#import "GradientColorViewController.h"




@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[@"popTable",@"两张图片合并",@"渐变颜色"];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,0 , 0) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    mWeakSelf
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        MMPopVC *vc= [[MMPopVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 0)
    {
        QuartzViewController *vc = [QuartzViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        GradientColorViewController *vc = [GradientColorViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
