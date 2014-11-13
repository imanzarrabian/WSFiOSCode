//
//  DetailViewController.h
//  VelibAppWSF
//
//  Created by Iman Zarrabian on 12/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic, strong) Station *station;
@end

