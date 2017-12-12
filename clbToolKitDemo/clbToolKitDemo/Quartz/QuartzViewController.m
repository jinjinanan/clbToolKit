//
//  QuartzViewController.m
//  clbToolKitDemo
//
//  Created by 陈林波 on 27/09/2017.
//  Copyright © 2017 clb. All rights reserved.
//

#import "QuartzViewController.h"


@interface QuartzViewController ()

@end

@implementation QuartzViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *img1 = [UIImage imageNamed:@"QQ截图20170801150412"];
    UIImage *img = [self addImage:[UIImage imageNamed:@"bg"] toImage:[UIImage imageNamed:@"QQ截图20170801150412"]];
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imageV];
    [imageV setFrame:CGRectMake(0, 100, img1.size.width, img.size.height)];
}

//两张图片合并
-(UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2
{
    UIGraphicsBeginImageContext(image2.size);
    
    //Draw image2
    [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
    
    //Draw image1
    [image1 drawInRect:CGRectMake(image2.size.width/2-image1.size.width/2, image2.size.height/2-image1.size.height/2, image1.size.width, image1.size.height)];
    
    UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImage;
}

//截图
//- (UIImage*) combineImageFromCuttingScreen {
//    
//    UIGraphicsBeginImageContext(self.baseImageView.frame.size);
//    UIGraphicsBeginImageContextWithOptions(self.combineView.frame.size, YES, 1);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetShouldAntialias(context, YES);
//    CGContextSetShouldSmoothFonts(UIGraphicsGetCurrentContext(),YES);
//    CGContextSaveGState(context);
//    CGRect r = CGRectMake(0, 0, 320, 392);
//    UIRectClip(r);
//    [self.combineView.layer renderInContext:context];
//    
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return  theImage;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
