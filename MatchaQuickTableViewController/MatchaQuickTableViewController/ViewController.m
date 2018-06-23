//
//  ViewController.m
//  MatchaQuickTableViewController
//
//  Created by 陈欢 on 2018/6/23.
//  Copyright © 2018年 Matcha00. All rights reserved.
//

#import "ViewController.h"
#import "MatchaCellModel.h"
#import "MatchaSettingTableViewCell.h"
@interface ViewController ()
@property (nonatomic,strong) NSArray  *sectionArray; /**< section模型数组*/
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MatchaCellModel *item1 = [[MatchaCellModel alloc]init];
    
    item1.funcName = @"111111";
    //item1.rowHeight = 66.0;
    item1.img = [UIImage imageNamed:@"icon_arrow"];
    item1.cellType = CHCellTypeSwitch;
    item1.detailText = @"1111111";
    item1.underlineX = CHUnderlineXWithImage;
    item1.clickCellAction = ^{
        NSLog(@"------------");
    };
    item1.switchChange = ^(BOOL isOn)
    {
        NSLog(@"推送提醒开关状态===%@",isOn?@"open":@"close");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"推送提醒" message:isOn?@"open":@"close" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    };
    MatchaCellModel *item2 = [[MatchaCellModel alloc]init];
    
    item2.funcName = @"111111";
    item2.img = [UIImage imageNamed:@"icon_arrow"];
    //item2.rowHeight = 100.0;
    item2.underlineX = CHUnderlineXWithLabel;
    item2.detailImage = [UIImage imageNamed:@"icon_arrow"];
    item2.cellType = CHCellTypeSwitch;
    item2.switchChange = ^(BOOL isOn)
    {
        NSLog(@"推送提醒开关状态===%@",isOn?@"open":@"close");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"推送提醒" message:isOn?@"open":@"close" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    };

    MatchaCellModel *item3 = [[MatchaCellModel alloc]init];
    
    item3.funcName = @"111111";
    //item3.img = [UIImage imageNamed:@"icon_arrow"];
    //item3.rowHeight = 120;
    item3.cellType = CHCellTypeDisclosureIndicator;
    item3.clickCellAction = ^{
        NSLog(@"------------");
    };
    self.sectionArray = @[item1,item2,item3];
    
    [self.tableView registerClass:[MatchaSettingTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sectionArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MatchaSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    cell.model = self.sectionArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MatchaCellModel *model = self.sectionArray[indexPath.row];
    
    if (model.rowHeight) {
        return model.rowHeight;
    } else {
        
        return 44;
        
    }
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MatchaCellModel *model = self.sectionArray[indexPath.row];
    
    if (model.clickCellAction) {
        model.clickCellAction();
    }
}









@end
