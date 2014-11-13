//
//  Station.m
//  VelibAppWSF
//
//  Created by Iman Zarrabian on 13/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import "Station.h"
#define IMAGE_URL @"http://vancruisers.ca/Members/bhughes/blog/topic_images/velib.png/image_large"

@implementation Station
/*
 [{"number":31705,"name":"31705 - CHAMPEAUX (BAGNOLET)","address":"RUE DES CHAMPEAUX (PRES DE LA GARE ROUTIERE) - 93170 BAGNOLET","position":{"lat":48.8645278209514,"lng":2.416170724425901},"banking":true,"bonus":true,"status":"OPEN","contract_name":"Paris","bike_stands":50,"available_bike_stands":46,"available_bikes":4,"last_update":1415882487000},{"number":10042,"name":"10042 - POISSONNIÃˆRE - ENGHIEN","address":"52 RUE D'ENGHIEN / ANGLE RUE DU FAUBOURG POISSONIERE - 75010 PARIS","position":
 
 */


- (void)fillWithDictionary:(NSDictionary *)dict {
    self.stationName = dict[@"name"];
    self.stationBikeAvailable = [dict[@"available_bikes"] integerValue];
    self.stationStandsAvailable = [dict[@"available_bike_stands"] integerValue];
    self.stationImageURL = IMAGE_URL;
    self.stationLat = [dict[@"position"][@"lat"] doubleValue];
    self.stationLng = [dict[@"position"][@"lng"] doubleValue];
}
@end
