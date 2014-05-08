//
//  AddEmployeeViewController.m
//  CoreDataDemo
//
//  Created by mac on 07/05/14.
//  Copyright (c) 2014 Webonise. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "CoreDataDemo.h"

@interface AddEmployeeViewController ()
{
    AppDelegate * appDelegate;
}
@end

@implementation AddEmployeeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    appDelegate = [UIApplication sharedApplication].delegate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAddTapped:(id)sender
{
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"AddEmployee" inManagedObjectContext:context];
    [object setValue:_txtFName.text forKey:@"firstName"];
    [object setValue:_txtLName.text forKey:@"lastName"];
    [object setValue:_txtMobile.text forKey:@"mobileNumber"];
    [object setValue:_txtCity.text forKey:@"cityName"];
    
    NSError *error;
    if (![context save:&error])
    {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
