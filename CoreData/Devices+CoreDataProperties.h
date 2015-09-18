//
//  Devices+CoreDataProperties.h
//  CoreData
//
//  Created by ArWin on 9/17/15.
//  Copyright © 2015 ArWin. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Devices.h"

NS_ASSUME_NONNULL_BEGIN

@interface Devices (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *brand;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *version;

@end

NS_ASSUME_NONNULL_END
