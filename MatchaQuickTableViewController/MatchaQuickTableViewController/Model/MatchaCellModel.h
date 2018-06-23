//
//  MatchaCellModel.h
//  MatchaQuickTableViewController
//
//  Created by 陈欢 on 2018/6/23.
//  Copyright © 2018年 Matcha00. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 指示类型 CHCellTypeNone默认不显示 CHCellTypeDisclosureIndicator显示箭头 CHCellTypeSwitch显示开关控件
typedef NS_ENUM(NSInteger, CHCellType) {
    
    CHCellTypeNone,
    CHCellTypeDisclosureIndicator,
    CHCellTypeSwitch,
    
    
};


// 设置cell下划线X值，在左侧同时存在图片和文字时下划线对齐谁 默认填充整个cell

typedef NS_ENUM(NSInteger, CHUnderlineX) {
    
    CHUnderlineXWithNone,
    CHUnderlineXWithImage,
    CHUnderlineXWithLabel,
    
} ;






@interface MatchaCellModel : NSObject
//左侧文字
@property (nonatomic, copy) NSString *funcName;
//左侧图片
@property (nonatomic, strong) UIImage *img;
//右侧详情文字
@property (nonatomic, copy) NSString *detailText;
//右侧详情图片
@property (nonatomic, strong) UIImage *detailImage;
// 设置row高度
@property (nonatomic, assign) CGFloat rowHeight;
// 右侧显示类型
@property (nonatomic, assign) CHCellType cellType;
// 下划线位置
@property (nonatomic, assign) CHUnderlineX underlineX;
// cell block
@property (nonatomic, copy) void (^clickCellAction)();
// switch block
@property (nonatomic, copy) void (^switchChange)(BOOL isOn);
@end
