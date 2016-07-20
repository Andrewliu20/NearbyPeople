//
//  PeopleCell.m
//  NearbyPeople
//
//  Created by andrewliu on 16/7/13.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import "PeopleCell.h"

@interface PeopleCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *distance;

@end

@implementation PeopleCell

- (void)setModel:(People *)model
{
    self.icon.image = [UIImage imageNamed:model.icon];
    
    self.name.text = model.name;
    
    self.distance.text = model.distance;
}

@end
