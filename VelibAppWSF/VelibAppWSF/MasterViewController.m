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
    self.stationsArray = @[@"station 1",@"station 2",@"station 3",@"station 4",@"station 5"];
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
            NSString *stationTitle = self.stationsArray[indexPath.row];
            DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
            detailVC.stationName = stationTitle;
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
    cell.stationNameLabel.text = self.stationsArray[indexPath.row];
   // cell.detailTextLabel.text = @"TOTOT";
    return cell;
}



@end
