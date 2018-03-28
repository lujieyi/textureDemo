//
//  WJViewMode.m
//  textureDemo
//
//  Created by jieyi lu on 2018/3/26.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "WJViewModel.h"
@interface WJViewModel()

@end
@implementation WJViewModel

//单例
static WJViewModel *instance;
+(instancetype)sharedModel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WJViewModel alloc]init];
    });
    return instance;
}
-(NSMutableArray<NSMutableArray<NSString *> *> *)data{
    if (_data == nil) {
        //初始化数据
        NSMutableArray *sectionArray = [NSMutableArray array];
        for(int i = 0 ; i<30 ;i++){
            NSMutableArray *innerArray = [NSMutableArray array];
            for(int j=0 ; j<10 ; j++){
                [innerArray addObject:[NSString stringWithFormat:@"section:%d,row:%d",i,j]];
            }
            sectionArray[i] = innerArray;
        }
        _data = sectionArray;
    }
    return _data;
}
-(NSMutableArray<NSString *> *)demos{
    if (_demos == nil) {
        _demos = [[NSMutableArray alloc]initWithObjects:@"taboola广告测试",@"ASNetworkImageNode测试",@"ASCollectionView测试",@"UICollectionView排序测试", nil];
    }
    return _demos;
}
@end
