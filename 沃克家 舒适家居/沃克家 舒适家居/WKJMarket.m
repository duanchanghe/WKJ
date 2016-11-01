//
//  WKJMarket.m
//  沃克家 舒适家居
//
//  Created by jundanuantong on 16/11/1.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "WKJMarket.h"

static NSString *cellIdentifier = @"UITableViewCell";
static NSString *WKJTypeIn = @"WKJTypeIn";
static NSString *WKJReport = @"WKJReport";
static NSString *WKJConsumer = @"WKJConsumer";
static NSString *WKJContract = @"WKJContract";
static NSString *WKJContacts = @"WKJContacts";
static NSString *WKJAddContacts = @"WKJAddContacts";

@interface WKJMarket ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation WKJMarket
{
    NSArray *VCArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addDataSource];
}

- (void)addDataSource
{
    _dataArray = @[@[@"function_statistics",@"客户录入"],
                   @[@"function_statistics",@"信息报备"],
                   @[@"function_marketing",@"我的客户"],
                   @[@"function_marketing1",@"合同管理"],
                   @[@"crm_search_icon",@"增加人脉"],
                   @[@"function_colleagues",@"人脉资源管理"]];
    VCArray = @[WKJTypeIn,
                WKJReport,
                WKJConsumer,
                WKJContract,
                WKJContacts,
                WKJAddContacts];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    
    cell.imageView.image = [UIImage imageNamed:_dataArray[indexPath.row][0]];
    cell.textLabel.text = _dataArray[indexPath.row][1];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetHeight(tableView.frame)/_dataArray.count;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:Storyboard(VCArray[indexPath.row])
                                         animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
