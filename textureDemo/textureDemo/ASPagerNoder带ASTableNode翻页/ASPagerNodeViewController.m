//
//  ASPagerNodeTableNodeViewController.m
//  textureDemo
//
//  Created by jieyi lu on 2018/3/29.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "ASPagerNodeViewController.h"
#import "ItemNode.h"

@interface ASPagerNodeViewController ()<ASPagerDelegate,ASPagerDataSource>

@end

@implementation ASPagerNodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ASPagerNode *pager  = [[ASPagerNode alloc]init];
//    pager.delegate = self;
    pager.dataSource = self;
    pager.frame = self.view.bounds;
    [self.view addSubnode:pager];
}
#pragma mark - datasource
- (NSInteger)numberOfPagesInPagerNode:(ASPagerNode *)pagerNode{
    return 20;
}
- (ASCellNodeBlock)pagerNode:(ASPagerNode *)pagerNode nodeBlockAtIndex:(NSInteger)index{
    return ^{
        ItemNode *node = [[ItemNode alloc]initWithString:[NSString stringWithFormat:@"index:%lu",index]];
        node.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
        return node ;
    };
}
@end
