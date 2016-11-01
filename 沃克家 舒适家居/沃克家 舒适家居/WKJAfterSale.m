//
//  WKJAfterSale.m
//  沃克家 舒适家居
//
//  Created by jundanuantong on 16/11/1.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "WKJAfterSale.h"
#import "WKJAfterSaleCell.h"

static NSString *AfterSaleCell = @"WKJAfterSaleCell";
static NSString *WKJDispatch = @"WKJDispatch";
static NSString *WKJDispatchList = @"WKJDispatchList";
static NSString *WKJBegin = @"WKJBegin";
static NSString *WKJWorking = @"WKJWorking";
static NSString *WKJCompele = @"WKJCompele";
static NSString *WKJServant = @"WKJServant";
static NSString *WKJMaintain = @"WKJMaintain";


@interface WKJAfterSale ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation WKJAfterSale
{
    NSArray *VCArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addDataSource];
    
}

- (void)addDataSource
{
    _dataArray =@[@[@"woyaopaigong",@"我要派工"],
                  @[@"paigongmingxi",@"派工明细"],
                  @[@"    ",@"    "],
                  @[@"weishigong",@"尚未施工"],
                  @[@"yiqishigongwan",@"施工进行中"],
                  @[@"quanbushigongwan",@"项目完成"],
                  @[@"shouhouguanli",@"售后管家"],
                  @[@"baoyangguanli",@"保养管理"],
                  @[@"  ",@"  "]];
    
    VCArray = @[WKJDispatch,
                WKJDispatchList,
                @"",
                WKJBegin,
                WKJWorking,
                WKJCompele,
                WKJServant,
                WKJMaintain,
                @""];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WKJAfterSaleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AfterSaleCell forIndexPath:indexPath];
    if (indexPath.row == 2 || indexPath.row == 8) {
        cell.backgroundColor = [UIColor clearColor];
    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.hidesBottomBarWhenPushed = YES;
    if (!(indexPath.row == 2 || indexPath.row == 8)) {
        [self.navigationController pushViewController:Storyboard(VCArray[indexPath.row])
                                             animated:YES];
    }
    self.hidesBottomBarWhenPushed = NO;
}



@end
