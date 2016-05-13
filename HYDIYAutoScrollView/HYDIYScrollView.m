//
//  HYDIYScrollView.m
//  HYDIYAutoScrollView
//
//  Created by 郝治鉴 on 16/5/13.
//  Copyright © 2016年 Hao.zj. All rights reserved.
//

#import "HYDIYScrollView.h"

@implementation HYDIYScrollView


- (HYDIYScrollView *)initWithFrame:(CGRect)frame numberOfScrollViews:(NSInteger)number Orientation:(NSUInteger)type imageArray:(NSArray *)imgArray titlesArray:(NSArray *)titlesArray{
    
    HYDIYScrollView *hYDIYScrollView = [[HYDIYScrollView alloc] initWithFrame:frame];
    
    self.numberOfScrollViews = number;
    
    self.oritentionType = type;
    
    
    
    return hYDIYScrollView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
            
    }
    return self;
    
}

@end
