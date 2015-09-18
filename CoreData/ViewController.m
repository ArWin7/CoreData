//
//  ViewController.m
//  CoreData
//
//  Created by ArWin on 9/17/15.
//  Copyright © 2015 ArWin. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Devices+CoreDataProperties.h"

@interface ViewController ()
{
    NSMutableArray *devices;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView delegate methods

-(NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [devices count];
}

-(UITableViewCell*)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *id = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id forIndexPath:indexPath];
    
    Devices *dev = [devices objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ : %@", [dev valueForKey:@"brand"],[dev valueForKey:@"version"]]];
    [cell.detailTextLabel setText:[dev valueForKey:@"name"]];
    
    return cell;
}

-(void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender {
    
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(void)viewWillAppear:(BOOL)animated {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchReq = [[NSFetchRequest alloc] initWithEntityName:@"Devices"];
    devices = [[context executeFetchRequest:fetchReq error:nil] mutableCopy];

    [self.tableView reloadData];
}
@end
