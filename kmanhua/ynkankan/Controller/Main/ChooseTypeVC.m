//
//  ChooseTypeVC.m
//  ynkankan
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "ChooseTypeVC.h"
#import "AppConstant.h"
#import "ChooseTypeCell.h"
#import "MainCreateNewsVC.h"


@interface ChooseTypeVC () <UITableViewDataSource, UITableViewDelegate, MainCreateNewsVCDelegate>
{

    NSInteger selctionIndex;
    
}

@property (strong, nonatomic) UITableView *chooseTable;

@end

@implementation ChooseTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];

}

- (void)initData{
    selctionIndex = 0;
}

- (void)initView{
    
    [self setTitle:@"选择类别"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
    [self initTableView];
    [self initBottomButton];
    [self setLeftButton];
    
}


#pragma mark 返回
-(void)setLeftButton {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_top_back"] style:UIBarButtonItemStylePlain target:self action:@selector(closeMethod)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark 返回
-(void)closeMethod{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)initBottomButton {

    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(15, kScreenHeight - 50, kScreenWidth - 30, 40);
    button.backgroundColor = Color_ButtonColor;
    button.layer.cornerRadius = 5.0f;
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickBotton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - 确认按钮
-(void)clickBotton:(UIButton *)button{

    [self gotoCreateVC];
    
}

- (void)initTableView {
    
    self.chooseTable = [[UITableView alloc] init];
    self.chooseTable.frame = CGRectMake((kScreenWidth - 200) / 2, 64.0f + 30.0f , 200, TABLE_CELL_HEIGHT * 4.0f + 5.0f);
    self.chooseTable.delegate = self;
    self.chooseTable.dataSource = self;
    self.chooseTable.bounces = NO;
    
    self.chooseTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.chooseTable];
    
}

#pragma mark - didCreate
-(void)didSuccessCreate{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"ChooseTypeCell";
    ChooseTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[ChooseTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        
    }
    
    [cell setModel:indexPath selection:selctionIndex];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return TABLE_CELL_HEIGHT;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    selctionIndex = indexPath.row;
    [self.chooseTable reloadData];
}

#pragma mark - goto
-(void)gotoCreateVC{
    MainCreateNewsVC *createVC = [[MainCreateNewsVC alloc] init];
    createVC.delegate = self;
    createVC.newsType = selctionIndex + 1;
    [self.navigationController pushViewController:createVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
