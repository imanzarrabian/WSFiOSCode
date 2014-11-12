//
//  StationTableViewCell.h
//  VelibAppWSF
//
//  Created by Iman Zarrabian on 12/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *stationNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *stationBikeAvailableLabel;
@property (nonatomic, weak) IBOutlet UILabel *stationStandsAvailableLabel;
@property (nonatomic, weak) IBOutlet UIImageView *stationImageView;


@end
