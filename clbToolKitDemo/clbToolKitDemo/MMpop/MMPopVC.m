//
//  MMPopVC.m
//  clbToolKitDemo
//
//  Created by 陈林波 on 12/10/2017.
//  Copyright © 2017 clb. All rights reserved.
//

#import "MMPopVC.h"
#import "PopTableViewView.h"

@interface MMPopVC ()

@property (nonatomic, strong) PopTableViewView *alertV;

@end

@implementation MMPopVC

- (void)viewDidLoad {
    [super viewDidLoad];
   

    
}
- (IBAction)clickPop:(id)sender
{
    mWeakSelf
    Config *conf = [Config new];
    conf.tableStyle = UITableViewStylePlain;
    conf.popStyle = MMPopupTypeSheet;
    conf.tableSize = CGSizeMake(mScreenWidth, 180);
    conf.numberOfSections = 1;
    conf.nameOfCellClassAry = @[@"UITableViewCell"];
    conf.isXib = NO;
    conf.separatorInset = UIEdgeInsetsMake(0, 0, 0, mScreenWidth);
    conf.setNumOfRows = ^NSInteger(NSInteger section) {
        return 1;
    };
    
    conf.setTableViewCell = ^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        cell.textLabel.text = @"aaaaaaaa";
        return cell;
    };
    
    
    self.alertV = [[PopTableViewView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) withConf:conf];
    [self.alertV show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
