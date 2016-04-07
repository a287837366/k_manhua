//
//  AmPhotoGroupViewController.m
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmPhotoHeader.h"
#import "AmPhotoGroupViewController.h"
#import "AmPhotoPikerTools.h"
#import "AmGourpViewCell.h"
#import "AmPhotoPickerAssetsViewController.h"

@interface AmPhotoGroupViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic , strong) NSArray *groups;



@end

@implementation AmPhotoGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"AmPhotoGroupViewController :: viewDidLoad");
    [self initView];
    
}

- (void)initView{

    self.view.backgroundColor = Background_Color;
    [self setTitle:@"选择相册"];
    [self setCancleButton];
    
    [self tableView];
    
    [self getGroupImage];
}

-(void)setCancleButton{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil) style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void)clickRightButton{
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)getGroupImage{

    AmPhotoPikerTools *dataTools = [[AmPhotoPikerTools alloc] init];
    
    __weak typeof(self) weakSelf = self;
    
    [dataTools getAllGroupWithPhotos:^(NSArray *groups) {
        weakSelf.groups = groups;
        
        [self gotoAsserVC:NO group:weakSelf.groups[0]];
        
        weakSelf.tableView.dataSource = weakSelf;
        [weakSelf.tableView reloadData];
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    AmGourpViewCell *cell = [AmGourpViewCell initCell:tableView];
    
    cell.model = self.groups[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 86;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self gotoAsserVC:YES group:self.groups[indexPath.row]] ;
}



-(void)gotoAsserVC:(BOOL)animation group:(AmPhotoGroupModel *)group{

    AmPhotoPickerAssetsViewController *assetsVC = [[AmPhotoPickerAssetsViewController alloc] init];
    assetsVC.selecteDelegate = self.selecteDelegate;
    assetsVC.maxCount = self.maxCount;
    assetsVC.groupModel = group;
    [self.navigationController pushViewController:assetsVC animated:animation];
}

#pragma mark - getset 
-(UITableView *)tableView{

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self.view addSubview:_tableView];
        
    }

    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}



@end
