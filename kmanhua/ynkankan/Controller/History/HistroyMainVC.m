//
//  HistroyMainVC.m
//  ynkankan
//
//  Created by apple on 16/2/29.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "HistroyMainVC.h"
#import "DataBaseManager.h"

@interface HistroyMainVC ()

@property (strong, nonatomic) UITableView *mainTable;

@end

@implementation HistroyMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initView];
    
    [[DataBaseManager shareInstance] getManhuaHistroy];
}

-(void)initView{
    [self setTitle:@"즐겨 찾기"];
    
}
#pragma mark - get set 

-(UITableView *)mainTable{

    if (!_mainTable) {
        
        
        
    }
    
    return _mainTable;
}

@end
