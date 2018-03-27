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
- (instancetype)init
{
    self = [super init];
    if (self) {
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
    return self;
}
@end
