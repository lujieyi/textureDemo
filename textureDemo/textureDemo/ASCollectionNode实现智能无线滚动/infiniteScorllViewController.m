//
//  infiniteScorllViewController.m
//  textureDemo
//
//  Created by jieyi lu on 2018/4/9.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "infiniteScorllViewController.h"
static const NSInteger kBatchSize = 10;

@interface infiniteScorllViewController ()<ASCollectionDelegate,ASCollectionDataSource>
@property (nonatomic,strong)ASCollectionNode *collectionNode;
@property (nonatomic,strong)NSMutableArray *data;
@end

@implementation infiniteScorllViewController
- (instancetype)init
{
    ASDisplayNode *node = [ASDisplayNode new];
    self = [super initWithNode:node];
    if (self) {
        self.node.backgroundColor = [UIColor whiteColor];
        //添加子控件并布局
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(380, 360);
        _collectionNode = [[ASCollectionNode alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
        [self.node addSubnode:_collectionNode];
        _collectionNode.delegate = self;
        _collectionNode.dataSource = self;
        _collectionNode.frame = [UIScreen mainScreen].bounds;
        [_collectionNode registerSupplementaryNodeOfKind:UICollectionElementKindSectionHeader];
        [_collectionNode registerSupplementaryNodeOfKind:UICollectionElementKindSectionFooter];
        
        _data  = [NSMutableArray array];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchMoreDataWithCompletion:nil];
}
-(void)fetchMoreDataWithCompletion:(void(^)(bool))completion{
    NSArray *array = [self getMoreDataWithDataCount:kBatchSize];
    [_data addObjectsFromArray:array];
    [_collectionNode insertItemsAtIndexPaths:[self getIndexPathFromArray:array]];
}
-(NSArray *)getMoreDataWithDataCount:(NSInteger)count{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<count; i++) {
        [array addObject:[ASCellNode new]];
    }
    return array;
}
-(NSArray *)getIndexPathFromArray:(NSArray *)array{
    NSMutableArray *indexpaths = [NSMutableArray array];
    for (ASCellNode *cellNode in array) {
        NSInteger index = [_data indexOfObject:cellNode];
        NSIndexPath *indexpath = [NSIndexPath indexPathWithIndex:index];
        [indexpaths addObject:indexpath];
    }
    return indexpaths;
}
#pragma mark - ASCollectionViewDatasource
- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode{
    return 1;
}

- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath{
    return ^{
        ASCellNode *cellNode = [ASCellNode new];
        cellNode.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
        return cellNode;
    };
}
//-(ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    return ^{
//        return [ASCellNode new];
//    };
//}
#pragma mark ASCollectionViewDelegate

  
@end
