//
//  ViewController.m
//  NearbyPeople
//
//  Created by andrewliu on 16/7/13.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import "ViewController.h"
#import "NearbyTableViewController.h"
@interface ViewController ()


@property (nonatomic,strong)UIButton *searchNearbyPeople;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    self.searchNearbyPeople = [[UIButton alloc] initWithFrame:CGRectMake(60, 200, 250, 60)];
    
    self.searchNearbyPeople.backgroundColor = [UIColor greenColor];
    [self.searchNearbyPeople setTitle:@"附近的人" forState:UIControlStateNormal];

    [self.searchNearbyPeople addTarget:self action:@selector(nearbyVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.searchNearbyPeople];
}

- (void)nearbyVC{
    
    NearbyTableViewController *nearby = [[NearbyTableViewController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nearby];
    
    
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
