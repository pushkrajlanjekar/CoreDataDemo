//
//  CoreDataDemo.h
//  CoreDataDemo
//
//  Created by mac on 07/05/14.
//  Copyright (c) 2014 Webonise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreDataDemo : NSManagedObject

@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * mobileNumber;

@end
