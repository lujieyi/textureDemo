//
//  UserProfileSampleViewController.m
//  textureDemo
//
//  Created by jieyi lu on 2018/4/3.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "UserProfileSampleViewController.h"
#import "UserProfileSampleView.h"

@interface UserProfileSampleViewController ()
@property (nonatomic,strong)ASDisplayNode *demoView;
@end

@implementation UserProfileSampleViewController
- (instancetype)init
{
    self = [super initWithNode:[ASDisplayNode new]];
    if (self) {
        self.node.backgroundColor = [UIColor whiteColor];
        _demoView = [UserProfileSampleView new];
        [self.node addSubnode:_demoView];
        __weak __typeof(self) weakself = self;
        self.node.layoutSpecBlock = ^ASLayoutSpec * _Nonnull(__kindof ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
            ASCenterLayoutSpec *centerLayoutSpec = [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringY sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY child:weakself.demoView];
            return centerLayoutSpec;
        };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
