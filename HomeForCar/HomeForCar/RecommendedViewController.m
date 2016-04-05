//
//  RecommendedViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/1.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "RecommendedViewController.h"
#import "MyTableViewController.h"
#import "DataModels.h"
#import "ToolManager.h"
#import "MJRefresh.h"
#define BUTTON_WIDTH 60
@interface RecommendedViewController ()<UIScrollViewDelegate>
{
    //种类数组
    NSMutableArray      *_kindArr;
    //待选数组
    NSMutableArray      *_waitArr;
    //按钮数组
    NSMutableArray      *_butArr;
    //下划红线
    UIImageView         *_lineView;
    //记录tag的整形
    NSInteger            _recInt;
    //小的更多视图
    UIView              *_moreView;
    UIScrollView        *navScrollView;
    UIScrollView        *_tabScrollView;
    // 用于赋值CGPoint
    CGPoint valuePoint;
    // 开始拖动的view的下一个view的CGPoint（如果开始位置是0 结束位置是4 nextPoint值逐个往下算）
    CGPoint nextPoint;
    NSMutableArray *tabArr;
    NSInteger butTag;
}

@end

@implementation RecommendedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tabArr = [[NSMutableArray alloc]init];
    _butArr = [[NSMutableArray alloc]init];
    _kindArr = [[NSMutableArray alloc]init];
    self.view.backgroundColor= [UIColor whiteColor];
    [_kindArr addObject:@"推荐"];
    [_kindArr addObject:@"新车"];
    [_kindArr addObject:@"评测"];
    [_kindArr addObject:@"导购"];
    [_kindArr addObject:@"视频"];
    [_kindArr addObject:@"用车"];
    [_kindArr addObject:@"玩车"];
    [_kindArr addObject:@"文化"];
    [_kindArr addObject:@"游记"];
    [_kindArr addObject:@"百科"];
    [_kindArr addObject:@"学车"];
    [_kindArr addObject:@"说车"];
    [_kindArr addObject:@"美图"];
    [_kindArr addObject:@"专题"];
    _waitArr = [[NSMutableArray alloc]init];
    _moreView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, CGRectGetMaxX(self.view.frame), 0)];
    _moreView.backgroundColor = [UIColor grayColor];
    _moreView.clipsToBounds = YES;
    _lineView = [[UIImageView alloc]init];
    navScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20,CGRectGetMaxX(self.view.frame) - 80,40)];
    [self.view addSubview:navScrollView];
    _tabScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, CGRectGetMaxY(self.view.frame) - 49 - 60)];
    [self.view addSubview:_tabScrollView];
    [self.view addSubview:_moreView];
    
    //更多按钮
    UIButton *downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake(CGRectGetMaxX(navScrollView.frame), 20, 40, 40);
    [downButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [downButton setTitle:@"更多" forState:UIControlStateNormal];
    [downButton setTitle:@"收起" forState:UIControlStateSelected];
    [downButton addTarget:self action:@selector(showMore:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downButton];
    
    [self layout];
    [self moreViewLayout];
    butTag = 1;
    [self getModel:butTag];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNewListFinish:) name:@"getNewList" object:nil];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}
//基本布局
-(void)layout
{
    [tabArr removeAllObjects];
    self.automaticallyAdjustsScrollViewInsets = NO;

    //类别按钮
    for (int i = 0; i < _kindArr.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:[_kindArr objectAtIndex:i] forState:UIControlStateNormal];
        button.frame = CGRectMake(CGRectGetMaxX(navScrollView.frame) / 4.0  * i ,0, BUTTON_WIDTH , 38);
        button.tag = 1 + i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [navScrollView addSubview:button];
        
        MyTableViewController *ctr = [[MyTableViewController alloc]initWithStyle:UITableViewStylePlain];
        ctr.kind = [_kindArr objectAtIndex:i];
        if (i == 0) {
            ctr.tableView.sectionHeaderHeight = 100;
           
        }
        else
        {
            ctr.tableView.sectionFooterHeight = 0;
        }
        ctr.tableView.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * i, 0, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame) - 60 - 49 );
        [tabArr addObject:ctr];
        ctr.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{ [self getModel:i + 1]; }];
        [self addChildViewController:ctr];
        [_tabScrollView addSubview:ctr.tableView];
        
        
    }
    navScrollView.backgroundColor = [UIColor whiteColor];
    navScrollView.contentSize = CGSizeMake(_kindArr.count * BUTTON_WIDTH, 0);
    //隐藏水平滚动条
    navScrollView.showsHorizontalScrollIndicator = NO;
    navScrollView.showsVerticalScrollIndicator = NO;

    CGSize size =  [[_kindArr objectAtIndex:0] sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} ];
    _lineView.backgroundColor = [UIColor redColor];
    _lineView.bounds = CGRectMake(0, 0, size.width, 3);
    _lineView.center = CGPointMake(30, 30);
    [navScrollView addSubview:_lineView];
    
    _tabScrollView.contentSize = CGSizeMake(self.view.frame.size.width * _kindArr.count, 0);
    _tabScrollView.pagingEnabled = YES;
    _tabScrollView.delegate = self;
}
//更多视图布局
-(void)moreViewLayout
{
 
    //小视图上的按钮
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 20)];
    label.text = @"已选择(长按移动/点击删除)";
    [_moreView addSubview:label];
    for (int i = 0 ; i < _kindArr.count; i++)
    {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        //        列数
        NSInteger  column = i%5;
        //        列间距
        float columnInterval  =  (self.view.frame.size.width - 60*5)/6.0;
        //        行数
        NSInteger  row = i/5;
        but.frame = CGRectMake(columnInterval+column*(columnInterval + 60), 25 + row*(10+30), 60, 30);
        but.backgroundColor = [UIColor redColor];
        but.tag = 100 + i;
        [but setTitle:[_kindArr objectAtIndex:i] forState:UIControlStateNormal];
        but.titleLabel.font = [UIFont systemFontOfSize:13];
        but.layer.borderWidth = 3;
        but.layer.borderColor = [UIColor blackColor].CGColor;
        but.layer.cornerRadius = 10;
        [_moreView addSubview:but];
        [_butArr addObject:but];
        
        // 长按手势
        UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        if (but.tag > 100)
        {
            [but addTarget:self action:@selector(doDelete:) forControlEvents:UIControlEventTouchUpInside];
            [but addGestureRecognizer:longPress];
        }
        
        

    }
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 + 50 * _kindArr.count / 5.0, self.view.frame.size.width, 20)];
    label2.text = @"点击添加";
    [_moreView addSubview:label2];

    
}
-(void)doDelete:(UIButton*)but
{
    //按钮下降
    if (but.tag < 200)
    {
        // 把需要删除view的下一个view移动到记录的view的位置(valuePoint)，并把下一view的位置记为新的nextPoint，并把view的tag值-1,依次处理
        __block CGPoint  wbtPoint = but.center;
        [UIView animateWithDuration:0.15 animations:^
         {
             //        列数
             NSInteger  column = _waitArr.count%5;
             //        列间距
             float columnInterval  =  (self.view.frame.size.width - 60*5)/6.0;
             //        行数
             NSInteger  row = _waitArr.count/5;
             but.frame = CGRectMake(columnInterval+column*(columnInterval + 60), 180 + row *(10+30) + 10, 60, 30);
             for (NSInteger i = but.tag - 100 + 1; i<_butArr.count; i++)
             {
                 UIButton * nextBt = (UIButton*)[_moreView viewWithTag:100+i];
                 nextPoint = nextBt.center;
                 nextBt.center = wbtPoint;
                 wbtPoint = nextPoint;
                 nextBt.tag --;
             }
             
         } completion:nil];
        [_butArr removeObject:but];
        
        [_kindArr removeObjectAtIndex:but.tag - 100];
        but.tag  = 200 + _waitArr.count;
        [_waitArr addObject:but];
    }
    //按钮上升
    else
    {
        // 把需要删除view的下一个view移动到记录的view的位置(valuePoint)，并把下一view的位置记为新的nextPoint，并把view的tag值-1,依次处理
        __block CGPoint  wbtPoint = but.center;
        [UIView animateWithDuration:0.15 animations:^
         {
             //        列数
             NSInteger  column = _butArr.count%5;
             //        列间距
             float columnInterval  =  (self.view.frame.size.width - 60*5)/6.0;
             //        行数
             NSInteger  row = _butArr.count/5;
             but.frame = CGRectMake(columnInterval+column*(columnInterval + 60), 25 + row*(10+30), 60, 30);
             for (NSInteger i = but.tag - 200 + 1; i < _waitArr.count; i++)
             {
                 UIButton * nextBt = (UIButton*)[_moreView viewWithTag:200+i];
                 nextPoint = nextBt.center;
                 nextBt.center = wbtPoint;
                 wbtPoint = nextPoint;
                 nextBt.tag --;
             }
             
         } completion:nil];
        
        
        but.tag = 100 + _butArr.count;
        [_waitArr removeObject:but];
        [_butArr addObject:but];
        [_kindArr addObject:but.titleLabel.text];

    }
    
    for (UIViewController *ctr in self.childViewControllers) {
        [ctr removeFromParentViewController];
    }
    for (UIView *view in [navScrollView subviews])
    {
        [view removeFromSuperview];
    }
    for (UIView *view in [_tabScrollView subviews])
    {
        [view removeFromSuperview];
    }
    //重新布局
    [self layout];
    //获取数据
    [self getModel:1];

}

//长按手势
-(void)longPress:(UIGestureRecognizer*)recognizer
{
    UIButton *recognizerView = (UIButton *)recognizer.view;
    if (recognizerView.tag > 200) {
        return;
    }
    
    // 禁用其他按钮的拖拽手势
    for (UIButton * bt in _butArr)
    {
        if (bt!=recognizerView)
        {
            bt.userInteractionEnabled = NO;
        }
    }
    // 长按视图在父视图中的位置（触摸点的位置）
    CGPoint recognizerPoint = [recognizer locationInView:_moreView];
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        
        // 开始的时候改变拖动view的外观（放大，改变颜色等）
        [UIView animateWithDuration:0.2 animations:^{
            recognizerView.transform = CGAffineTransformMakeScale(1.3, 1.3);
            recognizerView.alpha = 0.7;
        }];
        
        // 把拖动view放到最上层
        [_moreView bringSubviewToFront:recognizerView];
        
        // valuePoint保存最新的移动位置
        valuePoint = recognizerView.center;
        
    }
    else if(recognizer.state == UIGestureRecognizerStateChanged)
    {
        
        // 更新pan.view的center
        recognizerView.center = recognizerPoint;
        
        /**
         * 可以创建一个继承UIButton的类(MyButton)，这样便于扩展，增加一些属性来绑定数据
         * 如果在self.view上加其他控件拖拽会奔溃，可以在下面方法里面加判断MyButton，也可以把所有按钮放到一个全局变量的UIView上来替换self.view
         
         */
        for (UIButton * bt in _butArr)
        {
            // 判断是否移动到另一个view区域
            // CGRectContainsPoint(rect,point) 判断某个点是否被某个frame包含
            if (CGRectContainsPoint(bt.frame, recognizerView.center)&&bt!=recognizerView)
            {
                // 开始位置
                NSInteger fromIndex = recognizerView.tag - 100;
                
                // 需要移动到的位置
                NSInteger toIndex = bt.tag - 100;
                // 往后移动
                if ((toIndex-fromIndex)>0)
                {
                    
                    // 从开始位置移动到结束位置
                    // 把移动view的下一个view移动到记录的view的位置(valuePoint)，并把下一view的位置记为新的nextPoint，并把view的tag值-1,依次类推
                    [UIView animateWithDuration:0.2 animations:^{
                        for (NSInteger i = fromIndex + 1; i <= toIndex; i++)
                        {
                            UIButton * nextBt = (UIButton*)[_moreView viewWithTag:100+i];
                            nextPoint = nextBt.center;
                            nextBt.center = valuePoint;
                            valuePoint = nextPoint;
                            nextBt.tag --;

                        }
                        recognizerView.tag = 100 + toIndex;
                
                    }];
                    
                }
                // 往前移动
                else
                {
                    // 从开始位置移动到结束位置
                    // 把移动view的上一个view移动到记录的view的位置(valuePoint)，并把上一view的位置记为新的nextPoint，并把view的tag值+1,依次类推
                    [UIView animateWithDuration:0.2 animations:^{
                        for (NSInteger i = fromIndex - 1; i >= toIndex ; i--)
                        {
                            UIButton * nextBt = (UIButton*)[_moreView viewWithTag:100+i];
                            nextPoint = nextBt.center;
                            nextBt.center = valuePoint;
                            valuePoint = nextPoint;
                            nextBt.tag ++;
                        }
                        recognizerView.tag = 100 + toIndex;

                    }];
                    
                }
                NSString *str = [_kindArr objectAtIndex:fromIndex];
                [_kindArr removeObjectAtIndex:fromIndex];
                [_kindArr insertObject:str atIndex:toIndex];
            }
            
        }
        
        
    }
    else if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        // 恢复其他按钮的拖拽手势
        for (UIButton * bt in _butArr)
        {
            if (bt!=recognizerView) {
                bt.userInteractionEnabled = YES;
            }
        }
        // 结束时候恢复view的外观（放大，改变颜色等）
        [UIView animateWithDuration:0.2 animations:^{
            recognizerView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            recognizerView.alpha = 1;
            
            recognizerView.center = valuePoint;
        }];
        for (UIView *view in [navScrollView subviews])
        {
            [view removeFromSuperview];
        }
        [self layout];
        [self getModel:1];
    }
    
    
    
}


-(void)buttonClick:(UIButton*)but
{
    
    [self lineMove:but.tag];
    [_tabScrollView setContentOffset:CGPointMake(self.view.frame.size.width * (but.tag - 1) , 0) animated:YES];
    [self getModel:but.tag];
}
-(void)getModel:(NSInteger)tag
{
    butTag = tag;
    NSDictionary *dic = [[NSDictionary alloc]initWithObjects:
  @[@"http://telepathy.kakamobi.com/api/open/v2/article/recommendList.htm?_platform=android&_srv=t&_appName=qichetoutiao&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_vendor=xiaomi&_renyuan=Daisy&_version=2.7.1&_system=KTU84P&_manufacturer=Xiaomi&_systemVersion=4.4.4&_device=MI%20NOTE%20LTE&_imei=869436020938037&_productCategory=qichetoutiao&_operator=C&_androidId=f784b1c27c4c7339&_mac=10%3A2a%3Ab3%3A10%3Aa8%3A37&_appUser=094eb16692fd49c1aec965d12c8a28d0&_pkgName=cn.mucang.android.qichetoutiao&_screenDpi=2.75&_screenWidth=1080&_screenHeight=1920&_network=wifi&_launch=8&_webviewVersion=4.7&_firstTime=2016-03-01%2021%3A49%3A39&_userCity=&_p=&_gpsType=baidu&_cityName=%E9%83%91%E5%B7%9E%E5%B8%82&_cityCode=410100&_gpsCity=410100&_longitude=113.752206&_latitude=34.728664&_ipCity=350100&_j=1.0&_r=8ebf9d643c6e485597986aca185cfa27&sign=7faf55b21afd93269be1b9dada27c20901",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=c70a0f1d3891d4e16e5005342ab8821d&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=19&isLatest=true&limit=30&sign=b02039a4864f6ebad4e696b8a077018f",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=d991281dd05e7b48581d8e6fcd06e55e&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=7&isLatest=true&limit=30&sign=70fd57a34bf5dd86c81e6c17b1863cf8",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=4ce7696bdce3fe3ee16a0ec1d2a39e97&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=5&isLatest=true&limit=30&sign=b5f96ec85c40aa2d369e1f9e17d0a8bb",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=65b2f9461f5231e256d1110a48abd2bf&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=10&isLatest=true&limit=30&sign=763a66c35baaea09dc0967a8afb00194",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=71e33ec86b28f4f591f8946b1c6c8f29&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=6&isLatest=true&limit=30&sign=ee34315927972e4d274e3a4a5a26e31a",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=df7eed2a1dfbff338211f81c8be7546d&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=20&isLatest=true&limit=30&sign=8d22c3f83a57595ea79d755300928d62",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=774630ce2c62ce39690b85f68157f546&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=8&isLatest=true&limit=30&sign=dd857b5ba048dc11a3b7f9d3af877d2f",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=5298894656e1b982898d223efd84e66d&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=21&isLatest=true&limit=30&sign=43ce9e0a5d12075d0f2163f6e7fb5341",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=db5cb983baeae306cb39b877a40e3b75&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=22&isLatest=true&limit=30&sign=4d9fa03544a676d74bec6fce7ce5af50",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=f08824e645acb05e2f533d83f5455f01&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=23&isLatest=true&limit=30&sign=2f2249e9b29f733116a434a1b290d30e",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=c47c9f951b54156ebffe2d2d8d75a2aa&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=17&isLatest=true&limit=30&sign=d8824f1bd15604e405a26520b005e817",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=49a8186e04134c062939c6956d199d95&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=25&isLatest=true&limit=30&sign=3925ae3ac4213d3505796e2458978b6a",
    @"http://telepathy.kakamobi.com/api/open/v2/article/channelList.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_launch=2&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=5dd963b4d1d03b154724d445d959cdc9&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&channelId=27&isLatest=true&limit=30&sign=25df8a58ca718de732e4f09f1bb2bd54"] forKeys:@[@"推荐",@"新车",@"评测",@"导购",@"视频",@"用车",@"玩车",@"文化",@"游记",@"百科",@"学车",@"说车",@"美图",@"专题"]];

    ToolManager *manager = [[ToolManager alloc]init];
    [manager getNewListWith:[dic objectForKey:[_kindArr objectAtIndex:tag - 1]]];
}
-(void)getNewListFinish:(NSNotification*)not
{
    BaseClass *baseClass = [BaseClass modelObjectWithDictionary:not.userInfo];
    MyTableViewController *ctr = [tabArr objectAtIndex:butTag - 1];
    [ctr.tableView.header endRefreshing];
    ctr.arr = baseClass.data.itemList;
    [ctr.tableView reloadData];

}
//红线移动动画
-(void)lineMove:(NSInteger )i
{
    NSString *str = @"";
    str = [_kindArr objectAtIndex:i - 1];
    CGSize size =  [str sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} ];
    // 动画
    if (i > _recInt)
    {
        [UIView beginAnimations:@"right" context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        _lineView.center  = CGPointMake(BUTTON_WIDTH *i - 30 + 5,  _lineView.center.y );
        _lineView.bounds = CGRectMake(0,0 ,size.width , 3);
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:@"left" context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        _lineView.center  = CGPointMake(BUTTON_WIDTH *i - 30 - 5,  _lineView.center.y );
        _lineView.bounds = CGRectMake(0,0 ,size.width , 3);
        [UIView commitAnimations];
    }
    _recInt = i;
}
-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    if ([animationID isEqualToString:@"right"])
    {
        _lineView.center  = CGPointMake(_lineView.center.x - 5,  _lineView.center.y);
    }
    else
    {
        _lineView.center  = CGPointMake(_lineView.center.x + 5,  _lineView.center.y);

    }
    [UIView commitAnimations];
    
    
}
-(void)showMore:(UIButton*)but
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    if (but.selected)
    {
        _moreView.frame = CGRectMake(0, 60, CGRectGetMaxX(self.view.frame), 0);
    }
    else
    {
        _moreView.frame = CGRectMake(0, 60, CGRectGetMaxX(self.view.frame), 300);
    }
    [UIView commitAnimations];
    but.selected = !but.selected;
}
//减速调用的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.frame.size.width;
//    navScrollView.contentOffset = CGPointMake(BUTTON_WIDTH*page, 0);
    [navScrollView setContentOffset:CGPointMake(BUTTON_WIDTH*page, 0) animated:YES];
    [self lineMove:page + 1];
    [self getModel:page + 1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
