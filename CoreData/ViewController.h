//
//  ViewController.h
//  CoreData
//
//  Created by ArWin on 9/17/15.
//  Copyright © 2015 ArWin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

