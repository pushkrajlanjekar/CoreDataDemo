//
//  ListViewController.m
//  CoreDataDemo
//
//  Created by mac on 07/05/14.
//  Copyright (c) 2014 Webonise. All rights reserved.
//

#import "ListViewController.h"
#import "AddEmployeeViewController.h"
#import "CoreDataDemo.h"

@interface ListViewController ()
{
    AppDelegate * appDelegate;
    NSMutableArray * nameArry;
}
@end

@implementation ListViewController

@synthesize detailsArr;

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
    
    nameArry = [[NSMutableArray alloc]init];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self getData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nameArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cellidentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.textLabel.text = [nameArry objectAtIndex:indexPath.row];
    }

    return cell;
}

- (IBAction)btnAddNewTapped:(id)sender
{
    [nameArry removeAllObjects];
    AddEmployeeViewController * addEmployee = [[AddEmployeeViewController alloc]initWithNibName:@"AddEmployeeViewController" bundle:Nil];
    [self.navigationController pushViewController:addEmployee animated:YES];
}

- (void)getData
{
    [nameArry removeAllObjects];
    NSLog(@"Getdata Called");
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AddEmployee" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    
    if (!mutableFetchResults)
    {
        
    }
    
    detailsArr = mutableFetchResults;
    NSLog(@"firstNameArr : %@ Count : %d",detailsArr, detailsArr.count);
    
    for (int i=0; i<detailsArr.count; i++)
    {
        CoreDataDemo * coreDemo = [detailsArr objectAtIndex:i];
        [nameArry addObject:[NSString stringWithFormat:@"%@ %@",coreDemo.firstName,coreDemo.lastName]];
    }
    if (nameArry.count > 0)
    {
        [_tblList reloadData];
    }
}

@end
