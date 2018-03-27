//
//  WJViewMode.h
//  textureDemo
//
//  Created by jieyi lu on 2018/3/26.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJViewModel : NSObject
@property (nonatomic,strong)NSMutableArray<NSMutableArray<NSString*>*> *data;
+(instancetype)sharedModel;
@end
