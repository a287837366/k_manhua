//
//  MainNavigationView.m
//  ynkankan
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainNavigationView.h"
#import "AppConstant.h"

@interface MainNavigationView() <UITableViewDataSource, UITableViewDelegate>
{

    NSMutableArray *titleArray;
    
    NewsType currentType;

}

@property (strong, nonatomic) UITableView *cotogoryView;
@property (strong, nonatomic) UIView *blockView;

@end


@implementation MainNavigationView

-(instancetype)init{

    if (self = [super init]) {
        
        currentType = NewsTypeAll;
        
        self.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight);
        self.hidden = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchBlockView:)];
        
        titleArray = [[NSMutableArray alloc] initWithObjects:@"全部", @"招聘信息", @"求职信息", @"房产信息", @"宠物信息", nil];
        
        self.cotogoryView = [[UITableView alloc] init];
        self.cotogoryView.frame = CGRectMake(5, 5, kScreenWidth / 3, 0);
//        self.cotogoryView.frame = CGRectMake(5, 5, kScreenWidth / 3, (kScreenWidth / 3) * 2);
        self.cotogoryView.backgroundColor = [UIColor whiteColor];
        self.cotogoryView.delegate = self;
        self.cotogoryView.dataSource = self;
        self.cotogoryView.bounces = NO;
        self.cotogoryView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.cotogoryView.layer.borderColor = [Color_888888 CGColor];
        self.cotogoryView.layer.borderWidth = 0.5;
        self.cotogoryView.layer.cornerRadius = 4;
        
        
        self.blockView = [[UIView alloc] init];
        self.blockView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
        self.blockView.backgroundColor = [UIColor blackColor];
        self.blockView.alpha = 0.00;
        
        [self addSubview:self.blockView];
        [self addSubview:self.cotogoryView];
        [self.blockView addGestureRecognizer:tapGesture];
    }
    
    return self;
}

-(void) touchBlockView:(UIView *)view{
    [self hideNavigation:nil];
}

-(void)showNavigation:(UIView *)superView{

    [superView addSubview:self];
    self.hidden = NO;
    
    __weak typeof(self) weakSelf = self;

    [UIView animateWithDuration:0.5
                     animations:^{
                        
                         weakSelf.blockView.alpha = 0.05;
                         weakSelf.cotogoryView.frame = CGRectMake(5, 5, kScreenWidth / 3, (kScreenWidth / 3) * 2);
                     }
                     completion:^(BOOL finised){

                     }
     ];

    
    
    
    
}
-(void)hideNavigation:(UIView *)superView{
    
    
    
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         
                         weakSelf.blockView.alpha = 0.00;
                         weakSelf.cotogoryView.frame = CGRectMake(5, 5, kScreenWidth / 3, 0);
                     }
                     completion:^(BOOL finised){
                         weakSelf.hidden = YES;
                         [weakSelf removeFromSuperview];
                     }
     ];
    

    
}

-(NewsType)getType{
    return currentType;
}

#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * showUserInfoCellIdentifier = @"popCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier]
                ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = Color_666666;
    }
    
    cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
    
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return (kScreenWidth / 3) * 2 / 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentType = indexPath.row;
    
    [self.delegate didClickTypeByType:indexPath.row];
    [self hideNavigation:nil];
    
}

@end
