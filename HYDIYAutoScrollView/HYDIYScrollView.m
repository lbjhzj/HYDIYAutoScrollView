//
//  HYDIYScrollView.m
//  HYDIYAutoScrollView
//
//  Created by 郝治鉴 on 16/5/13.
//  Copyright © 2016年 Hao.zj. All rights reserved.
//

#import "HYDIYScrollView.h"

@interface HYDIYScrollView ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation HYDIYScrollView


- (HYDIYScrollView *)initWithFrame:(CGRect)frame numberOfScrollViews:(NSInteger)number Orientation:(NSUInteger)type imageArray:(NSArray *)imgArray titlesArray:(NSArray *)titlesArray{
    
    if (!number && !imgArray.count && !titlesArray.count) {
        return nil;
    }
    
    HYDIYScrollView *hYDIYScrollView = [[HYDIYScrollView alloc] initWithFrame:frame];
    
    self.numberOfScrollViews = number;
    
    self.oritentionType = type;
    
    self.titlesArray = titlesArray;
    
    self.imgArray = imgArray;
    
    for (UIImageView *img in imgArray) {
        
        [self.scrollView addSubview:img];
        [self addSubview:img];
    }
    self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    
    self.scrollView.contentSize = CGSizeMake(frame.size.width*number, frame.size.height);
    
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    _scrollView.bounces = YES;
    
    if (type==HYDIYScrollViewVertical) {
        _scrollView.alwaysBounceVertical = YES;
    }else{
        _scrollView.alwaysBounceHorizontal = YES;
    }
    
    _scrollView.directionalLockEnabled = YES;
    
    _scrollView.delegate = self;
    
     [self addSubview:self.scrollView];
    return hYDIYScrollView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor redColor];
        
        self.frame = frame;
        
       
    }
    return self;
    
}

@end
