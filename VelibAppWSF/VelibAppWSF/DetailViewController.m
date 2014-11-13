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

@interface DetailViewController () <CLLocationManagerDelegate>
@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, weak) IBOutlet UILabel *adresseLabel;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.station.stationName;
    self.adresseLabel.text = self.station.stationAdresse;
    [self createAndDisplayAnnotation];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
}


- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        self.mapView.showsUserLocation = YES;
    }

}

- (void)createAndDisplayAnnotation {
    
    StationAnnotation *stationAnnotion = [[StationAnnotation alloc] init];
    stationAnnotion.title = self.station.stationName;
    stationAnnotion.coordinate = CLLocationCoordinate2DMake(self.station.stationLat, self.station.stationLng);
    [self.mapView addAnnotation:stationAnnotion];
    
    MKCoordinateSpan span =  MKCoordinateSpanMake(0.005, 0.005);
    MKCoordinateRegion region = MKCoordinateRegionMake(stationAnnotion.coordinate, span);
    [self.mapView setRegion:region animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)displayRoute:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/maps?ll=%f,%f",self.station.stationLat,self.station.stationLng]]];
}

@end
