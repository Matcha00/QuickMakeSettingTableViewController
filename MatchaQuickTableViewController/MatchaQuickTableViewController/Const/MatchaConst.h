//
//  MatchaConst.h
//  MatchaQuickTableViewController
//
//  Created by 陈欢 on 2018/6/23.
//  Copyright © 2018年 Matcha00. All rights reserved.
//


#ifdef MatchaConst_h
#define MatchaConst_h

/// 设置RGB颜色和透明度
#define MatchaColorWithRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
///屏幕宽度
#define MatchaScreenWidth [UIScreen mainScreen].bound.size.width
///屏幕长度
#define MatchaScreenHeight [UIScreen mainScreen].bound.size.height
///屏幕范围
#define MatchaScreenBounds [UIScreen mainScreen].bounds

//功能图片到左边界的距离
#define MatchaFuncImgToLeftGap 15

//功能名称字体
#define MatchaFuncLabelFont 14

//功能名称到功能图片的距离,当功能图片funcImg不存在时,等于到左边界的距离
#define MatchaFuncLabelToFuncImgGap 15

//指示箭头或开关到右边界的距离
#define MatchaIndicatorToRightGap 15

//详情文字字体
#define MatchaDetailLabelFont 12

//详情到指示箭头或开关的距离
#define MatchaDetailViewToIndicatorGap 13

#endif /* MatchaConst_h */
