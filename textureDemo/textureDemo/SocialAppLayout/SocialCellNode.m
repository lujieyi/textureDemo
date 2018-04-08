//
//  SocialCellNode.m
//  textureDemo
//
//  Created by jieyi lu on 2018/4/8.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "SocialCellNode.h"
#import "TextStyles.h"
#import "Post.h"
@interface SocialCellNode()<ASNetworkImageNodeDelegate,ASTextNodeDelegate>
@end
@implementation SocialCellNode
{
    //头像
    ASNetworkImageNode *_avatarNode;
    //名字
    ASTextNode *_nameNode;
    //username
    ASTextNode *_userNameNode;
    ASTextNode *_timeNode;
    ASTextNode *_postNode;
    ASImageNode *_viaNode;
    Post *_post;
    
    
}
-(instancetype)initWithPost:(Post *)post{
    self = [super init];
    if (self) {
        _post = post;
        self.automaticallyManagesSubnodes = YES;
        //头像
//        _avatarNode = [ASNetworkImageNode new];
//        _avatarNode.URL = [NSURL URLWithString:post.photo];
////        _avatarNode.delegate = self;
//        _avatarNode.style.width = ASDimensionMakeWithPoints(44);
//        _avatarNode.style.height = ASDimensionMakeWithPoints(44);
//        _avatarNode.cornerRadius = 22.0;
//        _avatarNode.imageModificationBlock = ^UIImage * _Nullable(UIImage * _Nonnull image) {
//            CGRect rect = (CGRect){CGPointZero,CGSizeMake(image.size.width, image.size.height)};
//            UIGraphicsBeginImageContextWithOptions(image.size, false, [UIScreen mainScreen].scale);
//            [[UIColor grayColor]set];
//
//            [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:44]addClip];
//            [image drawInRect:rect];
//
//            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
//            path.lineWidth = 8;
//            path.lineCapStyle = kCGLineCapRound;
//            path.lineJoinStyle = kCGLineJoinRound;
//            [path stroke];
//
//            UIImage *modifiedImage;
//            modifiedImage = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//            return modifiedImage;
//        };
        
        _avatarNode = [[ASNetworkImageNode alloc] init];
        _avatarNode.backgroundColor = ASDisplayNodeDefaultPlaceholderColor();
        _avatarNode.style.width = ASDimensionMakeWithPoints(44);
        _avatarNode.style.height = ASDimensionMakeWithPoints(44);
        _avatarNode.cornerRadius = 22.0;
        _avatarNode.URL = [NSURL URLWithString:_post.photo];
        _avatarNode.imageModificationBlock = ^UIImage *(UIImage *image) {
            
            UIImage *modifiedImage;
            CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
            
            UIGraphicsBeginImageContextWithOptions(image.size, false, [[UIScreen mainScreen] scale]);
            
            [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:44.0] addClip];
            [image drawInRect:rect];
            modifiedImage = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            return modifiedImage;
            
        };
        
        _nameNode = [ASTextNode new];
        _nameNode.attributedText =[[NSAttributedString alloc]initWithString:post.name attributes:[TextStyles nameStyle]];
        
        _userNameNode = [ASTextNode new];
        _userNameNode.attributedText = [[NSAttributedString alloc]initWithString:post.username attributes:[TextStyles usernameStyle]];
        _userNameNode.truncationMode = NSLineBreakByTruncatingTail;
        
        _timeNode = [ASTextNode new];
        _timeNode.attributedText = [[NSAttributedString alloc]initWithString:post.time attributes:[TextStyles timeStyle]];
        
        if(post.via != 0){
            _viaNode = [ASImageNode new];
            _viaNode.image = (_post.via == 1) ? [UIImage imageNamed:@"icon_ios.png"] : [UIImage imageNamed:@"icon_android.png"];
        }
        
        _postNode = [ASTextNode new];
        _postNode.attributedText = [[NSAttributedString alloc]initWithString:post.post attributes:[TextStyles postStyle]];
    }
    return self;
}
-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    ASLayoutSpec *spacer = [ASLayoutSpec new];
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[_avatarNode,_nameNode,_userNameNode,spacer,_timeNode]];
    if (_post.via != 0) {
        [array addObject:_viaNode];
    }
    ASStackLayoutSpec *topStatckSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsCenter children:array];
//    topStatckSpec.style.alignSelf  = ASStackLayoutAlignSelfStretch;
    
    ASStackLayoutSpec *topAndPostSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:8 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[topStatckSpec,_postNode]];
//    topAndPostSpec.style.flexShrink = 1.0;
    
    ASStackLayoutSpec *avatarAndDetailSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:8 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_avatarNode,topAndPostSpec]];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:avatarAndDetailSpec];
}
#pragma mark - ASNetworkImageNodeDelegate methods.

//- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image
//{
//    [self setNeedsLayout];
//}
@end
