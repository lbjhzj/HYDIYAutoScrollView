//
//  ViewController.m
//  HYDIYAutoScrollView
//
//  Created by 郝治鉴 on 16/5/13.
//  Copyright © 2016年 Hao.zj. All rights reserved.
//

#import "ViewController.h"

#import "HYDIYScrollView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    img1.image = [UIImage imageNamed:@"150831_(1)"];
    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    img1.image = [UIImage imageNamed:@"150831_(1)"];
    UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    img1.image = [UIImage imageNamed:@"150831_(1)"];
    
    NSArray *imgArray = @[img1,img2,img3];
    NSArray *titlesArray = @[@"fasf",@"fafa",@"fasf"];
    HYDIYScrollView *HYView = [[HYDIYScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) numberOfScrollViews:5 Orientation:0 imageArray:imgArray titlesArray:titlesArray];
    
    [self.view addSubview:HYView];

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
