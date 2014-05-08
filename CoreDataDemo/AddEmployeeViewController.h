//
//  AddEmployeeViewController.h
//  CoreDataDemo
//
//  Created by mac on 07/05/14.
//  Copyright (c) 2014 Webonise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEmployeeViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtFName;
@property (weak, nonatomic) IBOutlet UITextField *txtLName;
@property (weak, nonatomic) IBOutlet UITextField *txtMobile;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;

- (IBAction)btnAddTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
