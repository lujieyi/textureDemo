//
//  ASCollectionViewTestViewController.m
//  textureDemo
//
//  Created by jieyi lu on 2018/3/28.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "ASCollectionViewTestViewController.h"
#import "HeaderCellNode.h"


@interface ASCollectionViewTestViewController ()<ASCollectionDelegate,ASCollectionDataSource>

@end

@implementation ASCollectionViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setupUI];
}
-(void)setupUI{
#define ITEMSIZE CGSizeMake(180, 90)
#define FOOTERREFERENCESIZE CGSizeMake(50,50)
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(180, 90);
    layout.footerReferenceSize = FOOTERREFERENCESIZE;
    layout.headerReferenceSize = FOOTERREFERENCESIZE;
    ASCollectionNode *collectionN = [[ASCollectionNode alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubnode:collectionN];
    collectionN.delegate = self;
    collectionN.dataSource = self;
    [collectionN registerSupplementaryNodeOfKind:UICollectionElementKindSectionFooter];
}
#pragma mark delegate
- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section{
    return 50;
}
- (ASCellNode *)collectionNode:(ASCollectionNode *)collectionNode nodeForItemAtIndexPath:(NSIndexPath *)indexPath{
    ASCellNode *node = [ASCellNode new];
    node.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    return node;
}
- (ASCellNode *)collectionNode:(ASCollectionNode *)collectionNode nodeForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ASCellNode *cellNode = [ASCellNode new];
    cellNode.backgroundColor = [UIColor redColor];
    return cellNode;
}

@end
