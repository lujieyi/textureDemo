//
//  addLinkInTextViewController.m
//  textureDemo
//
//  Created by jieyi lu on 2018/4/10.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "addLinkInTextViewController.h"
#import "postNode.h"

@interface addLinkInTextViewController ()<ASTextNodeDelegate>
@property (nonatomic,strong)ASTextNode *postNode;
@property (nonatomic,strong)ASEditableTextNode *attTV;
@end

@implementation addLinkInTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor grayColor];
    _attTV = [ASEditableTextNode new];
    _attTV.frame = self.view.bounds;
    _attTV.textView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    [self.view addSubnode:_attTV];
    
    
    //NSFontAttributeName   字号 UIFont 默认12
    //NSParagraphStyleAttributeName    段落样式  NSParagraphStyle
    //NSForegroundColorAttributeName    前景色   UIColor
    //NSBackgroundColorAttributeName    背景色   UIColor
    //NSObliquenessAttributeName        字体倾斜     NSNumber
    //NSExpansionAttributeName          字体加粗     NSNumber  比例 0就是不变 1增加一倍
    //NSKernAttributeName               字间距   CGFloat
    //NSUnderlineStyleAttributeName     下划线     1或0
    //NSUnderlineColorAttributeName     下划线颜色
    //NSStrikethroughStyleAttributeName 删除线   1或0
    //NSStrikethroughColorAttributeName 某种颜色
    //NSStrokeColorAttributeName        same as ForegroundColor
    //NSStrokeWidthAttributeName        CGFloat
    //NSLigatureAttributeName           连笔字  1或0  没看出效果
    //NSShadowAttributeName             阴影    NSShawdow
    //NSTextEffectAttributeName          设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用：
    //NSAttachmentAttributeName         NSTextAttachment  设置文本附件,常用插入图片
    //NSLinkAttributeName               链接  NSURL (preferred) or NSString
    //NSBaselineOffsetAttributeName     基准线偏移   NSNumber
    
    //NSWritingDirectionAttributeName   文字方向     @[@(1),@(2)]  分别代表不同的文字出现方向等等，我想你一定用不到它 - -
    //NSVerticalGlyphFormAttributeName  水平或者竖直文本  1竖直 0水平 在iOS没卵用，不支持竖版
    
    NSParagraphStyle *paragraph = [[NSParagraphStyle alloc]init];
    NSMutableParagraphStyle *muParagraph = [[NSMutableParagraphStyle alloc]init];
    muParagraph.lineSpacing = 10; // 行距
    muParagraph.paragraphSpacing = 20; // 段距
    muParagraph.firstLineHeadIndent = 30; // 首行缩进


    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[@"顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大 \n 顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大 \n 顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大 \n 顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大顶啊个点过到你噶的到那个大哥一档到那个点啊快递费请低迷期哦给您啊起码规定哦嘛个哦那顶底阿甘哦那顶建议的奶给你脑袋顶爱大" dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];


    NSRange range = NSMakeRange(0, attrStr.length);
    // 设置字体大小
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:range];
    //字间距
    [attrStr addAttribute:NSKernAttributeName value:@(1) range:range];
//    // 字体倾斜
//    [attrStr addAttribute:NSObliquenessAttributeName value:@(1) range:range];
//    // 字体加粗
//    [attrStr addAttribute:NSExpansionAttributeName value:@(0.5) range:range];
//    // 下划线
//    [attrStr addAttribute:NSUnderlineStyleAttributeName value:@(1) range:range];
//    [attrStr addAttribute:NSUnderlineColorAttributeName value:[UIColor blueColor] range:range];
//    // 删除线
//    [attrStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
//    [attrStr addAttribute:NSStrikethroughColorAttributeName value:[UIColor greenColor] range:range];
//
    // 连体字
//    [attrStr addAttribute:NSLigatureAttributeName value:@(1) range:range];
//
//
//    // 设置颜色
//    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.942 green:0.611 blue:0.771 alpha:1.000] range:range];
//    // 背景色
//    [attrStr addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithRed:0.475 green:0.482 blue:0.942 alpha:1.000] range:range];
//
//    // stroke描边
//    [attrStr addAttribute:NSStrokeColorAttributeName value:[UIColor blueColor] range:range];
//    [attrStr addAttribute:NSStrokeWidthAttributeName value:@(2) range:range];
//
//    // 设置段落样式
//    [attrStr addAttribute:NSParagraphStyleAttributeName value:muParagraph range:range];
//
//    // 文本方向
//    [attrStr addAttribute:NSVerticalGlyphFormAttributeName value:@(1) range:range];
//    [attrStr addAttribute:NSWritingDirectionAttributeName value:@[@(2),@(3)] range:range];
//
//
//    // 阴影
//    NSShadow *shadow = [[NSShadow alloc]init];
//    shadow.shadowOffset = CGSizeMake(2, 2);
//    shadow.shadowColor = [UIColor orangeColor];
//    shadow.shadowBlurRadius = 1;
//    [attrStr addAttribute:NSShadowAttributeName value:shadow range:range];
//
//    // 链接
//    [attrStr addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"http://www.jianshu.com/p/8f49c9c99b21"] range:range];
//
//    // 文字中加图片
    NSTextAttachment *attachment=[[NSTextAttachment alloc] initWithData:nil ofType:nil];
//
//    UIImage *img=[UIImage imageNamed:@"test.png"];
//    attachment.image=img;
//    attachment.bounds=CGRectMake(0, 0, 20, 20);
//    [attrStr addAttribute:NSAttachmentAttributeName value:attachment range:range];
//
//    // 基准线偏移
//    [attrStr addAttribute:NSBaselineOffsetAttributeName value:@(50) range:range];
    
    self.attTV.attributedText = attrStr;
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
    
    NSMutableAttributedString *originString = [[NSMutableAttributedString alloc]initWithString:@"【三亚】【四天三晚】点击报名 http://www.baidu.com 获取蜜月地昂啊的房啊的大噶法定啊的结果啊的#5dmark#东昂弄个我那个 熬干啊顶啊；经啊递送 <全文> 那个那时刚康地昂爱你的个 i 啊你个" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}];
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
