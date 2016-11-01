//
//  ViewController.m
//  沃克家 舒适家居
//
//  Created by jundanuantong on 16/11/1.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _LoginButton.layer.masksToBounds = YES;
    _LoginButton.layer.cornerRadius = CGRectGetWidth(_LoginButton.frame);
    
    
    

}


@end
