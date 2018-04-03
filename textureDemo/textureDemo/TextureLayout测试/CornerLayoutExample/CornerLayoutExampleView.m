//
//  CornerLayoutExampleView.m
//  textureDemo
//
//  Created by jieyi lu on 2018/4/3.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "CornerLayoutExampleView.h"
#import "Utilities.h"

@implementation CornerLayoutExampleView
{
    ASImageNode *imageNode1;
    ASImageNode *iconImage1;
    
    ASImageNode *imageNode2;
    ASImageNode *iconImage2;
    ASTextNode *badgeTextNode;
    
    ASImageNode *imageNode3;
    ASImageNode *iconImage3;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        
        static CGFloat const kSampleAvatarSize = 100;
        static CGFloat const kSampleIconSize = 26;
        static CGFloat const kSampleBadgeCornerRadius = 12;
        
        imageNode1 = [ASImageNode new];
        CGSize size = CGSizeMake(kSampleAvatarSize, kSampleAvatarSize);
        CGRect rect = (CGRect){CGPointZero,size};
        CGSize iconSize = CGSizeMake(kSampleIconSize, kSampleIconSize);
        CGRect iconRect = (CGRect){CGPointZero,iconSize};
        imageNode1.image = [UIImage imageWithSize:size fillColor:UIColor.lightGrayColor shapeBlock:^UIBezierPath *{
            return [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:kSampleBadgeCornerRadius];
        }];
        iconImage1 = [ASImageNode new];
        iconImage1.image = [UIImage imageWithSize:size fillColor:[UIColor redColor] shapeBlock:^UIBezierPath *{
            return [UIBezierPath bezierPathWithRoundedRect:iconRect cornerRadius:kSampleBadgeCornerRadius];
        }];
        
        imageNode2 = [ASImageNode new];
        imageNode2.image = [UIImage imageWithSize:size fillColor:UIColor.lightGrayColor shapeBlock:^UIBezierPath *{
            return [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:kSampleBadgeCornerRadius];
        }];
        badgeTextNode = [ASTextNode new];
        badgeTextNode.attributedText = [[NSAttributedString alloc]initWithString:@" 999+ "attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
        iconImage2 = [ASImageNode new];
        iconImage2.image = [UIImage imageWithSize:size fillColor:[UIColor redColor] shapeBlock:^UIBezierPath *{
            return [UIBezierPath bezierPathWithRoundedRect:iconRect cornerRadius:kSampleBadgeCornerRadius];
        }];
        
        imageNode3 = [ASImageNode new];
        imageNode3.image = [UIImage imageWithSize:size fillColor:UIColor.lightGrayColor shapeBlock:^UIBezierPath *{
            return [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:kSampleBadgeCornerRadius];
        }];
        iconImage3 = [ASImageNode new];
        iconImage3.image = [UIImage imageWithSize:size fillColor:[UIColor redColor] shapeBlock:^UIBezierPath *{
            return [UIBezierPath bezierPathWithRoundedRect:iconRect cornerRadius:kSampleBadgeCornerRadius];
        }];
    }
    return self;
}
//-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
//    ASCornerLayoutSpec *cornerSpec1 = [ASCornerLayoutSpec cornerLayoutSpecWithChild:imageNode1 corner:iconImage1 location:ASCornerLayoutLocationTopRight];
//    
//    ASBackgroundLayoutSpec *badgeSpec = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:badgeTextNode background:iconImage2];
//    ASCornerLayoutSpec *cornerSpec2 = [ASCornerLayoutSpec cornerLayoutSpecWithChild:imageNode2 corner:badgeSpec location:ASCornerLayoutLocationTopRight];
//    
//    ASCornerLayoutSpec *cornerSpec3 = [ASCornerLayoutSpec cornerLayoutSpecWithChild:imageNode3 corner:iconImage3 location:ASCornerLayoutLocationTopRight];
//    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
//    stackSpec.spacing = 40;
//    stackSpec.children = @[cornerSpec1, cornerSpec2, cornerSpec3];
//    return stackSpec;
//}
@end
