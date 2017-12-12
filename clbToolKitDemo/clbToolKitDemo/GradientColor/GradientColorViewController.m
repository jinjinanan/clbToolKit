//
//  GradientColorViewController.m
//  clbToolKitDemo
//
//  Created by 陈林波 on 14/10/2017.
//  Copyright © 2017 clb. All rights reserved.
//

#import "GradientColorViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GradientColorViewController ()

@end

@implementation GradientColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self demo];
}

-(void)demo
{
    UIColor *left = mRGBA(1, 220, 233, 1);
    UIColor *center = mRGBA(15, 226, 207, 1);
    UIColor *right = mRGBA(29, 233, 182, 1);
    CAGradientLayer *grandient = [CAGradientLayer layer];
    grandient.colors = [NSArray arrayWithObjects:(id)left.CGColor,(id)center.CGColor,(id)right.CGColor, nil];
    grandient.frame =self.view.bounds;
    grandient.startPoint = CGPointMake(0, 0);
    grandient.endPoint = CGPointMake(1, 0);
    [self.view.layer insertSublayer:grandient atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
