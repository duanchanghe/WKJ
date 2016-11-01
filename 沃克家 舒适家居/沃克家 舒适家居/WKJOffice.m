//
//  WKJOffice.m
//  沃克家 舒适家居
//
//  Created by jundanuantong on 16/11/1.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "WKJOffice.h"
#import "WKJOfficeCell.h"

static NSString *officeCell = @"WKJOfficeCell";

static NSString *WKJDiary = @"WKJDiary";
static NSString *WKJCheckDiary = @"WKJCheckDiary";
static NSString *WKJAttendance = @"WKJAttendance";
static NSString *WKJCheckAttendance = @"WKJCheckAttendance";
static NSString *WKJIncome = @"WKJIncome";
static NSString *WKJPayOut = @"WKJPayOut";
static NSString *WKJAccraditation = @"WKJAccraditation";
static NSString *WKJList = @"WKJList";
static NSString *WKJBill = @"WKJBill";

@interface WKJOffice ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation WKJOffice
{
    NSArray *VCArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDataSource];
}

- (void)addDataSource
{
    _dataArray = @[@[@"xiegongzuorizhi",@"写日志"],
                   @[@"chakanrizhi",@"查看日志"],
                   @[@"waichukaoqing",@"外出考勤"],
                   @[@"chakankaoqing",@"查看考勤"],
                   @[@"tianjiashour",@"添加收入"],
                   @[@"tianjiazhichu",@"添加支出"],
                   @[@"shouzhishenpi",@"收支审批"],
                   @[@"mingxiliushuizhang",@"明细流水"],
                   @[@"shouzhimingxi",@"收支总览"]];
    VCArray = @[WKJDiary,
                WKJCheckDiary,
                WKJAttendance,
                WKJCheckAttendance,
                WKJIncome,
                WKJPayOut,
                WKJAccraditation,
                WKJList,
                WKJBill];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WKJOfficeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:officeCell
                                                                    forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:Storyboard(VCArray[indexPath.row])
                                         animated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}

@end
