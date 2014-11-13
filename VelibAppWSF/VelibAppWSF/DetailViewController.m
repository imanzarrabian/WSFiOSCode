//
//  DetailViewController.m
//  VelibAppWSF
//
//  Created by Iman Zarrabian on 12/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.station.stationName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
