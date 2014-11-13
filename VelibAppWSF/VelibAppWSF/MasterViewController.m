//
//  MasterViewController.m
//  VelibAppWSF
//
//  Created by Iman Zarrabian on 12/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "StationTableViewCell.h"
#import "Station.h"

#define DETAIL_SEGUE @"showDetail"

@interface MasterViewController ()
@property (nonatomic,strong) NSArray *stationsArray;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createFakeData];
 }

- (void)createFakeData {
    
    Station *station1 = [[Station alloc] init];
    station1.stationName = @"toto 1";
    station1.stationBikeAvailable = 3;
    station1.stationStandsAvailable = 4;
    
    Station *station2 = [[Station alloc] init];
    station2.stationName = @"toto 2";
    station2.stationBikeAvailable = 12;
    station2.stationStandsAvailable = 8;
    
    Station *station3 = [[Station alloc] init];
    station3.stationName = @"toto 3";
    station3.stationBikeAvailable = 9;
    station3.stationStandsAvailable = 12;
    
    self.stationsArray = @[station1,station2,station3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
        
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
        
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:DETAIL_SEGUE]) {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath;
        if ([cell isKindOfClass:[UITableViewCell class]]) {
            indexPath = [self.tableView indexPathForCell:cell];
            DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
            detailVC.station = self.stationsArray[indexPath.row];
        }
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.stationsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Station *station = self.stationsArray[indexPath.row];
    cell.stationNameLabel.text = station.stationName;
    cell.stationBikeAvailableLabel.text = [NSString stringWithFormat:@"Il reste %ld vélos dispo",station.stationBikeAvailable];
    cell.stationStandsAvailableLabel.text = [NSString stringWithFormat:@"Il reste %ld Stands dispo",station.stationStandsAvailable];
    return cell;
}



@end
