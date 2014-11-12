//
//  MasterViewController.h
//  VelibAppWSF
//
//  Created by Iman Zarrabian on 12/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

