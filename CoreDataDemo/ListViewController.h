//
//  ListViewController.h
//  CoreDataDemo
//
//  Created by mac on 07/05/14.
//  Copyright (c) 2014 Webonise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray* detailsArr;
@property (weak, nonatomic) IBOutlet UITableView *tblList;
- (IBAction)btnAddNewTapped:(id)sender;

@end
