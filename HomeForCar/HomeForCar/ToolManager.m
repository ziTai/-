//
//  ToolManager.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/4.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "ToolManager.h"
#import "AFNetworking.h"
#import "DataModels.h"
@implementation ToolManager

//重写初始化方法
-(id)init
{
    self = [super init];
    if (self)
    {
        //写一些自定义属性的初始化
       
    }
    return self;
}
-(void)getNewListWith:(NSString*)url;

{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
    {
//        NSLog(@"成功");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getNewList"object:nil userInfo:responseObject];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
    }];

}
-(void)getHotListWithTag:(NSInteger)tag
{
    NSString*str = @"http://cheyouquan.kakamobi.com/api/open/cheyouquan/hot.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=9fb780f23138f918bf446796e45a9dd8&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&sign=ab904eba43dc7ffcb5e201eb9e2bfebf";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
     {
         //        NSLog(@"成功");
         [[NSNotificationCenter defaultCenter] postNotificationName:@"getHotList"object:nil userInfo:responseObject];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"失败");
     }];
}
-(void)getCommunityList
{
    NSString *str = @"http://cheyouquan.kakamobi.com/api/open/cheyouquan/club-list.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=289807d20a06e994e4f7bd34e8394602&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&sign=96093f00b002255ce084483b172104a1";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
     {
         //        NSLog(@"成功");
         [[NSNotificationCenter defaultCenter] postNotificationName:@"getCommunityList"object:nil userInfo:responseObject];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"失败");
     }];

}
-(void)getDetailCommunityListWithUrl:(NSString*)url
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
     {
         //        NSLog(@"成功");
         [[NSNotificationCenter defaultCenter] postNotificationName:@"getDetailCommunityList"object:nil userInfo:responseObject];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"失败");
     }];
}
-(void)getCarList
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *str = @"http://price.cartype.baojiazhijia.com/api/open/v2/car-basic/get-grouped-brand.htm?_jail=0&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_pkgName=cn.mucang.ios.qichetoutiaoios&_systemVersion=9.2.1&_device=iPhone%205s%20%28GSM%2BCDMA%29&_longitude=113.7427360781167&_screenHeight=1136.000000&_latitude=34.72930648874389&_appName=qichetoutiao&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_productCategory=qichetoutiao&_cityName=%E9%83%91%E5%B7%9E%E5%B8%82&_screenDip=2.000000&_system=iPhone%20OS&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_html5=true&_operator=C&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_gpsType=gps&_webviewVersion=4.6&_platform=iPhone&_appUser=fea6988b4c349aa203e125f9cc41dfcc&format=json&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_cityCode=410200&_screenWidth=640.000000&_renyuan=mucang&_network=wifi&_config=%7B%0A%0A%7D&_firstTime=2016-03-04%2014%3A44%3A55&_vendor=steveniphone&_version=2.6&sign=449b56f71b1d1c05f1aa017216cdcf8d";
    
    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
     {
         //        NSLog(@"成功");
         [[NSNotificationCenter defaultCenter] postNotificationName:@"getCarList"object:nil userInfo:responseObject];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"失败");
     }];
}
-(void)getNewsDetailWithartID:(NSString *)artID
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *str = @"http://telepathy.kakamobi.com/api/open/v2/article/entire-detail.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728637695312&_launch=12&_longitude=113.75268934462&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=521b38daab5014ed28b0c7bc604568ad&_renyuan=appstore&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&articleId=247194&authToken=42c09a32654564b765eac7b66c649a425487c1c8&carService=maiche&sign=a680dd1ea1e42c3934dfa450de8e0b3d";
    
    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
     {
         //        NSLog(@"成功");
         [[NSNotificationCenter defaultCenter] postNotificationName:@"getNewDetail"object:nil userInfo:responseObject];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"失败");
     }];

}
-(void)getDetailCarWithName:(NSInteger)count
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSArray *arr = [[NSArray alloc]initWithObjects:@"http://price.cartype.baojiazhijia.com/api/open/v2/car-basic/get-grouped-serial-list.htm?brandId=3&type=0&_jail=0&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_pkgName=cn.mucang.ios.qichetoutiaoios&_systemVersion=9.2.1&_device=iPhone%205s%20%28GSM%2BCDMA%29&_longitude=113.7427360781167&_screenHeight=1136.000000&_latitude=34.72930648874389&_appName=qichetoutiao&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_productCategory=qichetoutiao&_cityName=%E9%83%91%E5%B7%9E%E5%B8%82&_screenDip=2.000000&_system=iPhone%20OS&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_html5=true&_operator=C&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_gpsType=gps&_webviewVersion=4.6&_platform=iPhone&_appUser=fea6988b4c349aa203e125f9cc41dfcc&format=json&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_cityCode=410000&_screenWidth=640.000000&_renyuan=mucang&_network=wifi&_config=%7B%0A%0A%7D&_firstTime=2016-03-04%2014%3A44%3A55&_vendor=steveniphone&_version=2.6&sign=6ab47c79af765601c4c82314c6f6f2b4",@"http://price.cartype.baojiazhijia.com/api/open/v2/car-basic/get-grouped-serial-list.htm?brandId=3&type=1&_jail=0&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_pkgName=cn.mucang.ios.qichetoutiaoios&_systemVersion=9.2.1&_device=iPhone%205s%20%28GSM%2BCDMA%29&_longitude=113.7427360781167&_screenHeight=1136.000000&_latitude=34.72930648874389&_appName=qichetoutiao&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_productCategory=qichetoutiao&_cityName=%E9%83%91%E5%B7%9E%E5%B8%82&_screenDip=2.000000&_system=iPhone%20OS&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_html5=true&_operator=C&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_gpsType=gps&_webviewVersion=4.6&_platform=iPhone&_appUser=fea6988b4c349aa203e125f9cc41dfcc&format=json&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_cityCode=410000&_screenWidth=640.000000&_renyuan=mucang&_network=wifi&_config=%7B%0A%0A%7D&_firstTime=2016-03-04%2014%3A44%3A55&_vendor=steveniphone&_version=2.6&sign=3391b5f242788e6338e1c3e8074fd899",
    @"http://price.cartype.baojiazhijia.com/api/open/v2/car-basic/get-grouped-serial-list.htm?brandId=3&type=2&_jail=0&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_pkgName=cn.mucang.ios.qichetoutiaoios&_systemVersion=9.2.1&_device=iPhone%205s%20%28GSM%2BCDMA%29&_longitude=113.7427360781167&_screenHeight=1136.000000&_latitude=34.72930648874389&_appName=qichetoutiao&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_productCategory=qichetoutiao&_cityName=%E9%83%91%E5%B7%9E%E5%B8%82&_screenDip=2.000000&_system=iPhone%20OS&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_html5=true&_operator=C&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_gpsType=gps&_webviewVersion=4.6&_platform=iPhone&_appUser=fea6988b4c349aa203e125f9cc41dfcc&format=json&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_cityCode=410000&_screenWidth=640.000000&_renyuan=mucang&_network=wifi&_config=%7B%0A%0A%7D&_firstTime=2016-03-04%2014%3A44%3A55&_vendor=steveniphone&_version=2.6&sign=03e30726835d59349f57ad0a2d9a5142",nil];

    
    [manager GET:arr[count] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
     {
         //        NSLog(@"成功");
//         [[NSNotificationCenter defaultCenter] postNotificationName:@"getNewDetail"object:nil userInfo:responseObject];
         [self.delegate didGetDetailCar:responseObject];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"失败");
     }];

}
-(void)getCompetitorsList
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *str = @"http://price.cartype.baojiazhijia.com/api/open/v2/car-basic/get-compete-brand.htm?brandId=3&_jail=0&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_pkgName=cn.mucang.ios.qichetoutiaoios&_systemVersion=9.2.1&_device=iPhone%205s%20%28GSM%2BCDMA%29&_longitude=113.7427360781167&_screenHeight=1136.000000&_latitude=34.72930648874389&_appName=qichetoutiao&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_productCategory=qichetoutiao&_cityName=%E9%83%91%E5%B7%9E%E5%B8%82&_screenDip=2.000000&_system=iPhone%20OS&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_html5=true&_operator=C&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_gpsType=gps&_webviewVersion=4.6&_platform=iPhone&_appUser=fea6988b4c349aa203e125f9cc41dfcc&format=json&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_cityCode=410000&_screenWidth=640.000000&_renyuan=mucang&_network=wifi&_config=%7B%0A%0A%7D&_firstTime=2016-03-04%2014%3A44%3A55&_vendor=steveniphone&_version=2.6&sign=fe36e3cb711d8ed00c9664603e0fe2c9";
    
    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
     {
         [self.delegate didGetCompetitorsList:responseObject];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"失败");
     }];
}
-(void)brandStory:(NSInteger)brandID
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *str = [NSString stringWithFormat:@"http://price.cartype.kakamobi.com/api/open/car-type/introduction.htm?brandId=%ld",brandID];
    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject)
     {
         [self. delegate didGetBrandStory:responseObject];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"失败");
     }];

}
@end
