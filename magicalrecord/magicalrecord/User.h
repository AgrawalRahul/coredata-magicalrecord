//
//  User.h
//  magicalrecord
//
//  Created by Rahul Agrawal on 24/08/2014.
//  Copyright (c) 2014 Rahul Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) NSString * userName;

@end
