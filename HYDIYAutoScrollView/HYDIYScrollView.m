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

@property(nonatomic,strong)NSTimer* myTimer;

@end

static  NSUInteger const imgTag = 5646465;

@implementation HYDIYScrollView


- (HYDIYScrollView *)initWithFrame:(CGRect)frame numberOfScrollViews:(NSInteger)number Orientation:(HYScrollOrientation)type imageArray:(NSArray *)imgArray titlesArray:(NSArray *)titlesArray withAutoTime:(NSTimeInterval)time
{
    
    if (!number && !imgArray.count && !titlesArray.count)
    {
        return nil;
    }
    
    self = [self initWithFrame:frame];
    
    self.numberOfScrollViews = number;
    
    self.oritentionType = type;
    
    self.titlesArray = titlesArray;
    
    self.imgArray = imgArray;
    
    self.waitTime = time;
    
    self.viewFrame = frame;
    
    
    [self initScrollView];
    
    [self initTitleLabels];
    
    _myTimer = [NSTimer scheduledTimerWithTimeInterval:_waitTime target:self selector:@selector(autoScroll:) userInfo:nil repeats:YES];

    return self;
}

- (void)initTitleLabels
{
    for (int i=0; i<_titlesArray.count; i++)
    {
        UILabel *lbTitle = [[UILabel alloc] initWithFrame:CGRectMake(_viewFrame.origin.x + i*_viewFrame.size.width, _viewFrame.size.height-40, _viewFrame.size.width, 40)];
        lbTitle.backgroundColor = [UIColor darkGrayColor];
        lbTitle.alpha = .5;
        lbTitle.textAlignment = NSTextAlignmentCenter;
        lbTitle.text = _titlesArray[i];
        [_scrollView addSubview:lbTitle];
    }

    
}

- (void)initScrollView
{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:_viewFrame];
    
    self.scrollView.contentSize = CGSizeMake(_imgArray.count * _viewFrame.size.width, _viewFrame.size.height);
    
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    self.scrollView.bounces = YES;
    
    self.scrollView.pagingEnabled = YES;
    
    if (_oritentionType == HYDIYScrollViewVertical)
    {
        _scrollView.alwaysBounceVertical = YES;
    }
    else if(_oritentionType == HYDIYScrollViewHorizontal)
    {
        _scrollView.alwaysBounceHorizontal = YES;
    }
    
    for (int i=0; i<_imgArray.count; i++)
    {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i * _viewFrame.size.width, 0, _viewFrame.size.width, _viewFrame.size.height)];
        img.tag = imgTag + i;
        
        img.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        [img addGestureRecognizer:gesture];
        
        img.image = _imgArray[i];
        
        [self.scrollView addSubview:img];
    }
    _scrollView.directionalLockEnabled = YES;
    
    _scrollView.delegate = self;
    
    [self addSubview:self.scrollView];
}

- (void)autoScroll:(id)sender
{
    NSInteger currentIndex = _scrollView.contentOffset.x/self.frame.size.width;
    NSInteger nextIndex = currentIndex + 1;
    if (_imgArray.count == nextIndex)
    {
        nextIndex = 0;
    }
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width * nextIndex, 0) animated:YES];
    
}

- (void)dealloc{
    [_myTimer invalidate];
}


- (void)tapAction:(UITapGestureRecognizer *)sender
{
    NSLog(@"%lu",sender.view.tag - imgTag);
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        
        self.frame = frame;
    }
    return self;
}

@end
