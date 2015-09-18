//
//  DetailViewController.h
//  CoreData
//
//  Created by ArWin on 9/17/15.
//  Copyright © 2015 ArWin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *brand;
@property (weak, nonatomic) IBOutlet UITextField *version;
@property (weak, nonatomic) IBOutlet UITextField *company;

- (IBAction)cancelAction:(id)sender;
- (IBAction)saveAction:(id)sender;

@end
