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
#import "LikesNode.h"
#import "CommentsNode.h"
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
    ASImageNode *_optionNode;
    LikesNode *_likesNode;
    CommentsNode *_commentsNode;
    
}
-(instancetype)initWithPost:(Post *)post{
    self = [super init];
    if (self) {
        _post = post;
        self.automaticallyManagesSubnodes = YES;
        //头像
        _avatarNode = [ASNetworkImageNode new];
        _avatarNode.URL = [NSURL URLWithString:post.photo];
//        _avatarNode.delegate = self;
        //网络图片需要设置初始大小
        _avatarNode.style.width = ASDimensionMakeWithPoints(44);
        _avatarNode.style.height = ASDimensionMakeWithPoints(44);
//        _avatarNode.cornerRadius = 22.0;
        _avatarNode.imageModificationBlock = ^UIImage * _Nullable(UIImage * _Nonnull image) {
            CGRect rect = (CGRect){CGPointZero,CGSizeMake(image.size.width, image.size.height)};
            UIGraphicsBeginImageContextWithOptions(image.size, false, [UIScreen mainScreen].scale);
            [[UIColor grayColor]set];

            [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:44]addClip];
            [image drawInRect:rect];

            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
            path.lineWidth = 4;
            path.lineCapStyle = kCGLineCapRound;
            path.lineJoinStyle = kCGLineJoinRound;
            [path stroke];

            UIImage *modifiedImage;
            modifiedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return modifiedImage;
        };
        
        _nameNode = [ASTextNode new];
        _nameNode.attributedText =[[NSAttributedString alloc]initWithString:post.name attributes:[TextStyles nameStyle]];
        
        _userNameNode = [ASTextNode new];
        _userNameNode.attributedText = [[NSAttributedString alloc]initWithString:post.username attributes:[TextStyles usernameStyle]];
        _userNameNode.style.flexShrink = 1.0;
        _userNameNode.maximumNumberOfLines = 1;
        _userNameNode.truncationMode = NSLineBreakByTruncatingTail;
        
        _timeNode = [ASTextNode new];
        _timeNode.attributedText = [[NSAttributedString alloc]initWithString:post.time attributes:[TextStyles timeStyle]];
        
        if(post.via != 0){
            _viaNode = [ASImageNode new];
            _viaNode.image = (_post.via == 1) ? [UIImage imageNamed:@"icon_ios.png"] : [UIImage imageNamed:@"icon_android.png"];
        }
        
        _postNode = [ASTextNode new];
        _postNode.attributedText = [[NSAttributedString alloc]initWithString:post.post attributes:[TextStyles postStyle]];
//        _postNode.maximumNumberOfLines = 3;
        
        _likesNode = [[LikesNode alloc]initWithLikesCount:post.likes];
        
        _commentsNode = [[CommentsNode alloc]initWithCommentsCount:post.comments];
        
        _optionNode = [ASImageNode new];
        _optionNode.image = [UIImage imageNamed:@"icon_more"];
    }
    return self;
}
-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    ASLayoutSpec *spacer = [ASLayoutSpec new];
    spacer.style.flexGrow = 1.0;//1
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[_nameNode,_userNameNode,spacer,_timeNode]];
    if (_post.via != 0) {
        [array insertObject:_viaNode atIndex:array.count-1];
    }
    ASStackLayoutSpec *topStatckSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:array];
    topStatckSpec.style.alignSelf  = ASStackLayoutAlignSelfStretch;//2
    
    ASStackLayoutSpec *bottomSpec  = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:8 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[_likesNode,_commentsNode,_optionNode]];
    
    ASStackLayoutSpec *topAndPostSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:8 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[topStatckSpec,_postNode,bottomSpec]];
    topAndPostSpec.style.flexShrink = 1.0;
    
    ASStackLayoutSpec *avatarSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:8.0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_avatarNode,topAndPostSpec]];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:avatarSpec];
}
#pragma mark - ASNetworkImageNodeDelegate methods.

//- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image
//{
//    [self setNeedsLayout];
//}
@end
