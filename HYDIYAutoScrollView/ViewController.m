//
//  ViewController.m
//  HYDIYAutoScrollView
//
//  Created by 郝治鉴 on 16/5/13.
//  Copyright © 2016年 Hao.zj. All rights reserved.
//

#import "ViewController.h"

#import "HYDIYScrollView.h"

@interface ViewController ()<HYDIYScrollViewDelegate>
{
    HYDIYScrollView *HYView;
}
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *img1 = [UIImage imageNamed:@"150831_(1).jpg"];
    UIImage *img2 = [UIImage imageNamed:@"150831_(1).jpg"];

    UIImage *img3 = [UIImage imageNamed:@"150831_(1).jpg"];

    
    NSArray *imgArray = @[img1,img2,img3];
    
    NSArray *titlesArray = @[@"fasf",@"fafa",@"fasf"];
    
    HYView = [[HYDIYScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) numberOfScrollViews:3 Orientation:HYDIYScrollViewHorizontal imageArray:imgArray titlesArray:titlesArray withAutoTime:2.0];
    
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
