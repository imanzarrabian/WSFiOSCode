//
//  Station.h
//  VelibAppWSF
//
//  Created by Iman Zarrabian on 13/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Station : NSObject

@property (nonatomic, strong) NSString *stationName;
@property (nonatomic, strong) NSString *stationAdresse;

@property (nonatomic, assign) NSInteger stationBikeAvailable;
@property (nonatomic, assign) NSInteger stationStandsAvailable;
@property (nonatomic, strong) NSString *stationImageURL;
@property (nonatomic, assign) double stationLat;
@property (nonatomic, assign) double stationLng;




- (void)fillWithDictionary:(NSDictionary *)dict;
@end
