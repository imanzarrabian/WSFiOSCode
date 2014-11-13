//
//  DetailViewController.m
//  VelibAppWSF
//
//  Created by Iman Zarrabian on 12/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import "DetailViewController.h"
#import <MapKit/MapKit.h>
#import "StationAnnotation.h"

@interface DetailViewController ()
@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.station.stationName;
    [self createAndDisplayAnnotation];
    //self.mapView.showsUserLocation = YES;
}

- (void)createAndDisplayAnnotation {
    StationAnnotation *stationAnnotion = [[StationAnnotation alloc] init];
    stationAnnotion.title = self.station.stationName;
    stationAnnotion.coordinate = CLLocationCoordinate2DMake(self.station.stationLat, self.station.stationLng);
    [self.mapView addAnnotation:stationAnnotion];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
