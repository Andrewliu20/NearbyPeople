//
//  People.h
//  NearbyPeople
//
//  Created by andrewliu on 16/7/13.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface People : NSObject

//头像
@property (nonatomic,copy)NSString *icon;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *distance;
//位置 经度
@property (nonatomic,copy) NSString *longiT;
//纬度
@property (nonatomic,copy) NSString *latiT;

@end
