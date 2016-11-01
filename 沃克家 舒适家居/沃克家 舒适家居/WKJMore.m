//
//  WKJMore.m
//  沃克家 舒适家居
//
//  Created by jundanuantong on 16/11/1.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "WKJMore.h"
static NSString *cellIdentifier = @"UITableViewCell";

static NSString *WKJWebsit = @"WKJWebsit";
static NSString *WKJCustomer = @"WKJCustomer";
static NSString *WKJAsk = @"WKJAsk";
static NSString *WKJUpdata = @"WKJUpdata";
static NSString *WKJAbout = @"WKJAbout";

@interface WKJMore ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation WKJMore
{
    NSArray *VCArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDataSource];
    
}

- (void)addDataSource
{
    _dataArray = @[@[@"ic_home_website",@"官方网站:www.woke.com"],
                   @[@"ic_home_tel",@"联系客服:"],
                   @[@"ic_home_consult",@"问题解答"],
                   @[@"ic_home_update",@"检查更新"],
                   @[@"ic_home_about",@"关于沃克家"]];
    VCArray = @[WKJWebsit,
                WKJCustomer,
                WKJAsk,
                WKJUpdata,
                WKJAbout,];
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
