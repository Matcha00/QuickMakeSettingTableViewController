//
//  MatchaSectionModel.h
//  MatchaQuickTableViewController
//
//  Created by 陈欢 on 2018/6/23.
//  Copyright © 2018年 Matcha00. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MatchaSectionModel : NSObject


@property (nonatomic, copy) NSString *sectionHeaderName;

@property (nonatomic, assign) CGFloat sectionHeaderHeight;

@property (nonatomic, copy) NSArray *cellArray;

@property (nonatomic, strong) UIColor *sectionHeaderBgColor;



@end
