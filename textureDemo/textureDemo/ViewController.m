//
//  ViewController.m
//  textureDemo
//
//  Created by jieyi lu on 2018/3/23.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>


#import "TextureTestASNetworkImageNodeViewController.h"
#import "TaboolaTestViewController.h"
#import "ASCollectionViewTestViewController.h"
#import "UICollectionViewTestViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCellReuseID"];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [WJViewModel sharedModel].demos.count;
}
static NSString *reuseID = @"tableViewCellReuseID";
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    cell.textLabel.text = [WJViewModel sharedModel].demos[indexPath.row];
    return cell;
}
#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
        {
            TaboolaTestViewController *vc = [TaboolaTestViewController new];
            vc.title = [WJViewModel sharedModel].demos[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            TextureTestASNetworkImageNodeViewController *vc = [TextureTestASNetworkImageNodeViewController new];
            vc.title = [WJViewModel sharedModel].demos[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            ASCollectionViewTestViewController *vc = [ASCollectionViewTestViewController new];
            vc.title = [WJViewModel sharedModel].demos[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:
        {
            UICollectionViewTestViewController *vc =  [UICollectionViewTestViewController new];
            vc.title = [WJViewModel sharedModel].demos[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}



@end
