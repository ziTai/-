//
//  CarCollectionViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/11.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "CarCollectionViewController.h"
#import "MyCollectionViewCell.h"
#import "carDataModels.h"
#import "UIImageView+WebCache.h"
#import "HeadCollectionReusableView.h"
#import "AIMTableViewIndexBar.h"
#import "CarDetailViewController.h"

@interface CarCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,AIMTableViewIndexBarDelegate>
{
    AIMTableViewIndexBar    *indexBar;
}
@end

@implementation CarCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Register cell classes
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HeadCollectionReusableView" bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellID"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    NSArray *Arr = [[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z", nil];
    indexBar = [[AIMTableViewIndexBar alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) - 20,(self.view.frame.size.height - Arr.count*15)/2.0, 20, Arr.count*15)];
    indexBar.delegate = self;
    [indexBar setIndexes:Arr];
    [self.view addSubview:indexBar];
    [self.view bringSubviewToFront:indexBar];

    
}
- (void)tableViewIndexBar:(AIMTableViewIndexBar *)indexBar didSelectSectionAtIndex:(NSInteger)index
{
    
    if ([self.collectionView numberOfSections] > index && index > -1){
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    }
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return _arr.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    carData *data = [_arr objectAtIndex:section];

    return data.lists.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    carData *data = [_arr objectAtIndex:indexPath.section];
    carLists *list = [data.lists objectAtIndex:indexPath.row];
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.picImg sd_setImageWithURL:[NSURL URLWithString:list.imgUrl] placeholderImage:[UIImage imageNamed:@"Icon"]];
    cell.nameLabel.text = list.name;
    
    return cell;
}
#pragma mark <UICollectionViewDelegate>
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        HeadCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellID" forIndexPath:indexPath];
        carData *data = [_arr objectAtIndex:indexPath.section];
        carLists *list = [data.lists objectAtIndex:0];
    
        
        headerView.headLabel.text = list.firstLetter;
        reusableview =  headerView;
        
    }
    return reusableview;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    carData *data = [_arr objectAtIndex:indexPath.section];
    carLists *list = [data.lists objectAtIndex:indexPath.row];
    CarDetailViewController *detailVC = [[CarDetailViewController alloc]init];
    detailVC.imgUrl = list.imgUrl;
    detailVC.name = list.name;
    detailVC.brandID = list.listsIdentifier;
    [self.navigationController pushViewController:detailVC animated:YES];

    
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
