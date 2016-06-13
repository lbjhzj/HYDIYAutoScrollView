//
//  HYDIYScrollView.h
//  HYDIYAutoScrollView
//
//  Created by 郝治鉴 on 16/5/13.
//  Copyright © 2016年 Hao.zj. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  ScrollView的滑动方向
 */
typedef NS_OPTIONS(NSUInteger, HYScrollOrientation) {
    /**
     *  竖直滑动
     */
    HYDIYScrollViewVertical     =1 << 0,
    /**
     *  水平滑动
     */
    HYDIYScrollViewHorizontal   =1 << 1,
};


typedef void(^HYActionBlock)(NSInteger index);

@protocol HYDIYScrollViewDelegate <NSObject>

@optional



@end

@class HYDIYScrollView;

@interface HYDIYScrollView : UIView


/**
 *  轮播图自动滑动开关
 */
@property(assign,nonatomic)BOOL autoSwitch;

/**
 *  轮播图自动滑动的间隔时间(只有autoSwitch开关开启状态才可设置，默认为关闭状态)
 */
@property(assign,nonatomic)NSTimeInterval waitTime;

/**
 *  轮播图的标题设置
 */
@property(copy,nonatomic)NSArray *titlesArray;

/**
 *  轮播图的图片设置（数组内部为UIImage类型）
 */
@property(copy,nonatomic)NSArray *imgArray;


/**
 *  轮播图的个数(轮播图个数以此参数为首要参照，如果此值未被设置，则以imgArray的个数为主，再次则以titlesArray的个数为主)
 */
@property(assign,nonatomic)NSInteger numberOfScrollViews;

/**
 *  滑动方向
 */
@property(assign,nonatomic)NSUInteger oritentionType;



@property(weak,nonatomic)id HYDIYScrollViewDelegate;


/**
 *  自定义的轮播图的初始化方法
 *
 *  @param frame  轮播图的位置，尺寸配置
 *  @param number 轮播图的数量
 *
 *  @return HYDIYScrollView
 */
- (HYDIYScrollView *)initWithFrame:(CGRect)frame numberOfScrollViews:(NSInteger)number Orientation:(HYScrollOrientation)type imageArray:(NSArray *)imgArray titlesArray:(NSArray *)titlesArray;

/**
 *  系统初始化方法
 *
 *  @param frame 轮播图的位置，尺寸信息
 *
 *  @return 
 */
- (instancetype)initWithFrame:(CGRect)frame;

@end
