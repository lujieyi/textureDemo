//
//  addLinkInTextViewController.m
//  textureDemo
//
//  Created by jieyi lu on 2018/4/10.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "addLinkInTextViewController.h"
#import "postNode.h"
#import <Foundation/Foundation.h>

@interface addLinkInTextViewController ()<ASTextNodeDelegate>
@property (nonatomic,strong)ASTextNode *postNode;
@property (nonatomic,strong)ASEditableTextNode *attTV;
@property (nonatomic,strong)ASTextNode *postNode2;
@end

@implementation addLinkInTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _postNode2 = [postNode new];
    [self.view addSubnode:_postNode2];
    _postNode2.frame = CGRectMake(20, 300, 350, 300);
    _postNode2.backgroundColor = [UIColor lightGrayColor];

}



-(void)addLinkInText{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *kLinkAttributeName = @"TextLinkAttributeName";
    _postNode = [postNode new];
    [self.view addSubnode:_postNode];
    _postNode.frame = CGRectMake(10, 200, 390, 300);
    _postNode.delegate = self;
    _postNode.linkAttributeNames = @[kLinkAttributeName];
    _postNode.userInteractionEnabled = YES;
    
    NSMutableAttributedString *originString = [[NSMutableAttributedString alloc]initWithString:@"【三亚】【四天三晚】点击报名 http://www.baidu.com 获取蜜月地昂啊的房啊的大噶法定啊的结果啊的#5dmark#东昂弄个我那个 熬干啊顶啊；经啊递送 <全文> 那个那时刚康地昂爱你的个 i 啊你个" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}];
    NSDataDetector *detector  = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    //    NSString *string;
    [detector enumerateMatchesInString:originString.string options:kNilOptions range:NSMakeRange(0, originString.string.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        if (result.resultType == NSTextCheckingTypeLink) {
            NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                              NSFontAttributeName : [UIFont systemFontOfSize:15.0],
                                                                                              NSForegroundColorAttributeName: [UIColor colorWithRed:59.0/255.0 green:89.0/255.0 blue:152.0/255.0 alpha:1.0],
                                                                                              NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                                                                                              }];
            mutableDic[kLinkAttributeName] = [NSURL URLWithString:result.URL.absoluteString];
            NSString *template = @"🔗链接";
            [originString replaceCharactersInRange:result.range withAttributedString:[[NSAttributedString alloc]initWithString:template attributes:@{NSForegroundColorAttributeName:[UIColor blueColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}]];
            [originString addAttributes:mutableDic range:NSMakeRange(result.range.location, template.length)];
            
        }
    }];
    _postNode.attributedText = originString;
    
    
    //    NSString *pattern = @"<(.*?)>";
    //    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionDotMatchesLineSeparators error:nil];
}
#pragma mark - ASTextNodeDelegate
- (void)textNode:(ASTextNode *)textNode tappedLinkAttribute:(NSString *)attribute value:(id)value atPoint:(CGPoint)point textRange:(NSRange)textRange{
    
    [[UIApplication sharedApplication]openURL:value options:@{} completionHandler:nil];
}

@end
