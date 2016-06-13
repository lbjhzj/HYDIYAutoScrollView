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

static  NSUInteger const imgTag = 5646465;

@implementation HYDIYScrollView


- (HYDIYScrollView *)initWithFrame:(CGRect)frame numberOfScrollViews:(NSInteger)number Orientation:(HYScrollOrientation)type imageArray:(NSArray *)imgArray titlesArray:(NSArray *)titlesArray{
    
    if (!number && !imgArray.count && !titlesArray.count) {
        return nil;
    }
    
    self = [self initWithFrame:frame];
    
    self.numberOfScrollViews = number;
    
    self.oritentionType = type;
    
    self.titlesArray = titlesArray;
    
    self.imgArray = imgArray;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    
    self.scrollView.contentSize = CGSizeMake(imgArray.count * frame.size.width, frame.size.height);
    
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    self.scrollView.bounces = YES;
    
    self.scrollView.pagingEnabled = YES;
    
    if (type==HYDIYScrollViewVertical)
    {
        _scrollView.alwaysBounceVertical = YES;
    }
    else if(type == HYDIYScrollViewHorizontal)
    {
        _scrollView.alwaysBounceHorizontal = YES;
    }
    
    for (int i=0; i<imgArray.count; i++)
    {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i * frame.size.width, 0, frame.size.width, frame.size.height)];
        img.tag = imgTag + i;
        
        img.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [img addGestureRecognizer:gesture];
        img.image = imgArray[i];
        [self.scrollView addSubview:img];
    }
    
    _scrollView.directionalLockEnabled = YES;
    
    _scrollView.delegate = self;
    
     [self addSubview:self.scrollView];
    

    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)sender{
    NSLog(@"%lu",sender.view.tag - imgTag);
    
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
