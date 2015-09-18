//
//  DetailViewController.m
//  CoreData
//
//  Created by ArWin on 9/17/15.
//  Copyright © 2015 ArWin. All rights reserved.
//

#import "DetailViewController.h"
#import "Devices.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Core Data methods


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)saveAction:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    Devices *device = [NSEntityDescription insertNewObjectForEntityForName:@"Devices" inManagedObjectContext:context];
    device.brand = self.brand.text;
    device.version = self.version.text;
    device.name = self.company.text;

    NSError *error;
    if(![context save:&error]) {
        NSLog(@"Data could not be saved: %@", [error description]);
    }
    
    //Check your added Data
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Devices" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for( Devices *fetchedDevice in fetchedObjects) {
        Devices *device = fetchedDevice;
        NSLog(@"Fetched Data : %@",device);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
