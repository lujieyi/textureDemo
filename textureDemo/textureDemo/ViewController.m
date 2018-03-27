//
//  ViewController.m
//  textureDemo
//
//  Created by jieyi lu on 2018/3/23.
//  Copyright © 2018年 jieyi lu. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <TaboolaSDK/TaboolaJS.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "WJCollectionViewCell.h"
#import "WJCollectionViewSupplementaryCellCollectionViewCell.h"
#import "WJViewModel.h"
@interface ViewController ()<ASTableDelegate,ASTableDataSource,WKNavigationDelegate,TaboolaJSDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,weak)UILongPressGestureRecognizer *longPressGesture;
@property (nonatomic,weak)UICollectionView *collectionView;

@end

@implementation ViewController
{
    WKWebView *webview;
    
    //HorizontalWithinVerticalScrollingTest
    ASTableNode *_tableNode;
}
- (instancetype)init
{
    _tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self taboolaTest];
//    [self textureTestASNetworkImageNode];
//    [self textureTextASCollectionView];
//    [self UICollectionViewTest];
    [self HorizontalWithinVerticalScrollingTest];
}
-(void)HorizontalWithinVerticalScrollingTest{

}
-(void)textureTestASNetworkImageNode{
    ASNetworkImageNode *imageNode = [[ASNetworkImageNode alloc]init];
    [self.view addSubnode:imageNode];
    imageNode.frame = self.view.bounds;
    imageNode.contentMode = UIViewContentModeScaleAspectFit;
    imageNode.URL = [NSURL URLWithString:@"https://i.pinimg.com/originals/07/44/38/074438e7c75034df2dcf37ba1057803e.gif"];
    imageNode.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
}
-(void)textureTextASCollectionView{
    
}
-(void)UICollectionViewTest{
    //添加长按手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress)];
    _longPressGesture = longPressGesture;
    [self.view addGestureRecognizer:longPressGesture];
#define ITEMSIZE CGSizeMake(180, 90)
#define FOOTERREFERENCESIZE CGSizeMake(50,50)
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(180, 90);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.sectionInset = UIEdgeInsetsZero;
    layout.footerReferenceSize = FOOTERREFERENCESIZE;
    layout.headerReferenceSize = FOOTERREFERENCESIZE;
    UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView = collectionV;
    [self.view addSubview:collectionV];
    collectionV.delegate = self;
    collectionV.dataSource = self;
    [collectionV registerClass:[WJCollectionViewCell class] forCellWithReuseIdentifier:@"WJCollectionViewCell"];
    [collectionV registerClass:[WJCollectionViewSupplementaryCellCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WJCollectionViewSupplementaryCellCollectionViewCell"];
     [collectionV registerClass:[WJCollectionViewSupplementaryCellCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"WJCollectionViewSupplementaryCellCollectionViewCell"];
    
}
- (void)handleLongPress
{
    UICollectionView *collectionView = _collectionView;
    CGPoint location = [self.longPressGesture locationInView:collectionView];
    switch (self.longPressGesture.state) {
        case UIGestureRecognizerStateBegan: {
            NSIndexPath *indexPath = [collectionView indexPathForItemAtPoint:location];
            if (indexPath) {
                [collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        [collectionView updateInteractiveMovementTargetPosition:location];
        break;
        case UIGestureRecognizerStateEnded:
        [collectionView endInteractiveMovement];
        break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        [collectionView cancelInteractiveMovement];
        break;
        case UIGestureRecognizerStatePossible:
        // nop
        break;
    }
}
// Support for reordering
- (BOOL)beginInteractiveMovementForItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)updateInteractiveMovementTargetPosition:(CGPoint)targetPosition{

}
- (void)endInteractiveMovement{

}
- (void)cancelInteractiveMovement{

}
#pragma mark - UICollectionViewDatasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [WJViewModel sharedModel].data.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [WJViewModel sharedModel].data[section].count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WJCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    [cell setUPData:indexPath];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *text;
    WJCollectionViewSupplementaryCellCollectionViewCell *supplementaryCell;
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        text = @"header";
       supplementaryCell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WJCollectionViewSupplementaryCellCollectionViewCell" forIndexPath:indexPath];
    }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        text = @"footer";
        supplementaryCell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"WJCollectionViewSupplementaryCellCollectionViewCell" forIndexPath:indexPath];
    }
    supplementaryCell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    [supplementaryCell setUPData:indexPath];
    return supplementaryCell;
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    NSString *model =  [WJViewModel sharedModel].data[sourceIndexPath.section][sourceIndexPath.row];
    [[WJViewModel sharedModel].data[sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.row];
    [[WJViewModel sharedModel].data[destinationIndexPath.section] insertObject:model atIndex:destinationIndexPath.row];
}

#pragma mark UIColectionViewDelegate


-(void)taboolaTest{
    webview = [[WKWebView alloc] init];
    [self.view addSubview:webview];
    
    webview.navigationDelegate = self;
    
    webview.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray* horizConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webview]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:@{@"webview": webview}];
    NSArray* vertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[webview]-0-|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:@{@"webview": webview}] ;
    [self.view addConstraints:horizConstraints];
    [self.view addConstraints:vertConstraints];
    
    [TaboolaJS sharedInstance].delegate = self;
    //    [[TaboolaJS sharedInstance] setLogLevel:LogLevelWarning];
    [[TaboolaJS sharedInstance] registerWebView:webview];
    [self loadExamplePage];
}
- (void)loadExamplePage {
    
    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"sampleFeedContentPage" ofType:@"html"];
    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:appHtml baseURL: [NSURL URLWithString:@"https:"]];
//    [webview loadHTMLString:[self htmlString1] baseURL: [NSURL URLWithString:@"https:"]];
}
-(NSString *)htmlString1{
    NSString *str = @"\
    <html>\
    <head>\
    <meta name='viewport' content='width=device-width, user-scalable=no' />\
    <script type=\"text/javascript\">\
    window._taboola = window._taboola || [];\
    _taboola.push({article:'auto', url:'http://www.example.com'});\
    !function (e, f, u, i) {\
        if (!document.getElementById(i)){\
            e.async = 1;\
            e.src = u;\
            e.id = i;\
            f.parentNode.insertBefore(e, f);\
        }\
    }(document.createElement('script'),\
      document.getElementsByTagName('script')[0],\
      'https://cdn.taboola.com/libtrc/betterbytheminute-app/mobile-loader.js','tb-mobile-loader-script');\
    </script>\
    </head>\
    <body>\
    <div id='taboola'>\
    </div>\
    <script type='text/javascript'>\
    _taboola.push({\
    mode: 'thumbnails-feed',\
    container: 'taboola',\
    placement: 'feed',\
    target_type: 'mix'\
    });\
    _taboola[\"mobile\"] = [];\
    _taboola[\"mobile\"].push({\
    allow_sdkless_load:true,\
    taboola_view_id:new Date().getTime(),\
    publisher:\"betterbytheminute-app\"\
    });\
    </script>\
    </body>\
    </html>";
    return str;
}
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
}
@end
