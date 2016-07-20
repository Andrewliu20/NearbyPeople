//
//  NearbyTableViewController.m
//  NearbyPeople
//
//  Created by andrewliu on 16/7/13.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import "NearbyTableViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "People.h"
#import "PeopleCell.h"
@interface NearbyTableViewController ()<CLLocationManagerDelegate>

@property (nonatomic,strong)CLLocationManager *locationManager;
//位置
@property (nonatomic,strong)CLLocation *location;

@property (nonatomic,strong)NSMutableArray *peopleArray;

@end

@implementation NearbyTableViewController
{
    BOOL flag;
}



- (void)dealloc
{
    [self.peopleArray removeAllObjects];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
    self.title = @"附近的人";
    
    //返回
    [self backItem];
    
    [self loadUI];
    
    //获取自己的位置
    [self locationOfSelf];
    
    
   
}



- (void)loadUI{
    
    
    self.tableView.delegate = self;
    
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PeopleCell" bundle:nil] forCellReuseIdentifier:@"mycell"];
}

- (void)loadData{
    
   
    
    People *people1 = [People new];
    
    people1.name = @"张三";
    people1.icon = @"me.png";
    people1.longiT =@"121.513610";
    people1.latiT = @"31.232924";
    
    people1.distance = [self distanceBetweenOrderBy:people1];
    
//    NSLog(@"%lf",[people1.latiT  doubleValue]);
    [self.peopleArray addObject:people1];
    
    
    [self.tableView reloadData];
}


-(NSString *)distanceBetweenOrderBy:(People *) p
{
    
    CLLocation* curLocation = [[CLLocation alloc] initWithLatitude:self.location.coordinate.latitude   longitude:self.location.coordinate.longitude];
    CLLocation* otherLocation = [[CLLocation alloc] initWithLatitude:[p.latiT doubleValue] longitude:[p.longiT doubleValue]];
    double distance  = [curLocation distanceFromLocation:otherLocation];
    
//    NSLog(@"%lf",self.location.coordinate.latitude );
    
    if (distance /1000 > 1) {
        return [NSString stringWithFormat:@"%.0f公里以内",distance/1000];
    }else{
        if (distance <= 100) {
            return [NSString stringWithFormat:@"100米以内"];
        }else if(distance <= 200){
            return [NSString stringWithFormat:@"200米以内"];
        }else if(distance <= 300){
        
            return [NSString stringWithFormat:@"300米以内"];
        }else if(distance <= 400){
            return [NSString stringWithFormat:@"400米以内"];
        }else if(distance <= 500){
            return [NSString stringWithFormat:@"500米以内"];
        }else if(distance <= 600){
            return [NSString stringWithFormat:@"600米以内"];
        }else if(distance <= 700){
            return [NSString stringWithFormat:@"700米以内"];
        }else if(distance <= 800){
            return [NSString stringWithFormat:@"800米以内"];
        }else if(distance <= 900){
            return [NSString stringWithFormat:@"900米以内"];
        }else{
            return [NSString stringWithFormat:@"1000米以内"];
        }
       
    }
    
    
}


- (void)locationOfSelf{

    self.locationManager = [[CLLocationManager alloc]init];
    
    self.locationManager.delegate = self;
    
    //设置位置精度
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    self.locationManager.distanceFilter = 10.0f;
    
    //定位
    
    [self.locationManager startUpdatingLocation];
    
    
    
}



- (void)backItem{
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(clickBack)];
    self.navigationItem.leftBarButtonItem = btn;
}

- (void)clickBack{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -- 定位协议

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    
    //获取位置
    _location = locations[0];
    
    
    [self.locationManager stopUpdatingLocation];
    
    NSLog(@"%f,%f",self.location.coordinate.longitude,self.location.coordinate.latitude);
    
    //加载数据
    if (!flag) {
         [self loadData];
        flag = YES;
        
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.peopleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    PeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
//    
//    People *p = self.peopleArray[indexPath];
    cell.model = self.peopleArray[indexPath.row];
    
    return cell;
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

- (NSMutableArray *)peopleArray
{
    if (_peopleArray == nil) {
         _peopleArray = [NSMutableArray array];
    }
    
    return _peopleArray;
}

@end
