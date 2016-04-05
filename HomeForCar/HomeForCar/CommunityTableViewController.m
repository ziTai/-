//
//  CommunityTableViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/8.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "CommunityTableViewController.h"
#import "ComTableViewCell.h"
#import "comDataModels.h"
#import "UIImageView+WebCache.h"
#import "HotTableViewController.h"
#import "ToolManager.h"
@interface CommunityTableViewController ()

@end

@implementation CommunityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ComTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 90;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    comItemList *model = [_arr objectAtIndex:indexPath.row];
    ComTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell.myImgView sd_setImageWithURL:[NSURL URLWithString:model.logoUrl]];
    cell.namelabel.text = model.name;
    cell.numberLaebl.text = [NSString stringWithFormat:@"成员 %.f",model.memberCount];
    cell.countLabel.text = [NSString stringWithFormat:@"今日话题 %.f",model.status];
    cell.descrLabel.text = model.desc;
    
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSArray *arr = [[NSArray alloc]initWithObjects:
    @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=8df2c4fbca891018adadc47b3e2e8290&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=552&limitId=1805587&sign=65224fedc3061f06943ced6c36400c91",                                                                               @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=1bb76b39607e982cc4c391e2e0bfa036&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=366&limitId=2021650&sign=31f357c1997cc69c8e3b135904ba5f1d",
        @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=f05920d380071f1c3c47c010426d7535&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=362&limitId=2021826&sign=ff36967424cbe55f4a41876c4716b564",
            @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=d0babae12cc93705249f7cda3b1a36a6&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=363&limitId=2020623&sign=d311a7fe9200d2592bb364179c22c817",
                @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=2df53a33e155edeb952091d77bbee681&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=364&limitId=2020305&sign=c197816443ee4f087a8f88081a56ac71",
                    @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=a3efcc99248821de70fa9a8e33d1945d&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=365&sign=715dd171f7b46bded92882a9a881a810",
                    @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=20f46d3fceafef0efdea8e8c76824523&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=370&limitId=1996233&sign=7a595732f3b9fbd18cf0be3a89472fe3",
                    @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=719b3527ee88d0c20c1cec3379b2dfb5&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=384&limitId=2019783&sign=c3d2050fa217585f5068813a331dc5cf",
                    @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=59217fda85cd23c5364432fe75971280&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=550&limitId=1953588&sign=ee32d19ddd87f733a1275d20d796a8c2",
                    @"http://cheyouquan.kakamobi.com/api/open/topic/list-by-publish-time.htm?_appName=qichetoutiao&_appUser=fea6988b4c349aa203e125f9cc41dfcc&_cityCode=410100&_cityName=%E9%83%91%E5%B7%9E&_device=%E5%B0%8F%E4%BA%94s%20%283%29&_firstTime=2016-03-04%2014%3A44%3A54&_gpsCity=410100&_gpsType=baidu&_idfa=7E782B5A-A9D6-4323-8EFF-882A6B23A053&_idfv=54CADE9D-51E6-405D-AC9C-DDCF50BB02BE&_imei=981bf036651aba58a4c51f0482d2fac345002a81&_j=1.0&_jail=false&_latitude=34.728643934462&_launch=7&_longitude=113.75261338976&_mac=981bf036651aba58a4c51f0482d2fac345002a81&_manufacturer=Apple&_network=wifi&_openUuid=981bf036651aba58a4c51f0482d2fac345002a81&_operator=C&_pkgName=cn.mucang.ios.qichetoutiaoios&_platform=iphone&_product=%E6%B1%BD%E8%BD%A6%E5%A4%B4%E6%9D%A1&_productCategory=qichetoutiao&_r=053168f33bc377158c1329a162667c0c&_renyuan=appstore&_saturnVersion=1.5&_screenDip=2&_screenHeight=1136&_screenWidth=640&_system=iPhone%20OS&_systemVersion=9.2.1&_vendor=appstore&_version=2.6&authToken=42c09a32654564b765eac7b66c649a425487c1c8&clubId=551&limitId=1988384&sign=443ac4b9f55dd903af764d80663a8423",nil];
    HotTableViewController *detailVC = [[HotTableViewController alloc]initWithStyle:UITableViewStylePlain];
    ToolManager *manager = [[ToolManager alloc]init];
    
    [manager getDetailCommunityListWithUrl:[arr objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailVC animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
