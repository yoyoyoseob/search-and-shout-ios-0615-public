//
//  FISSearchViewController.m
//  searchAndShout
//
//  Created by Joe Burgess on 7/2/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISSearchViewController.h"
#import "FISResultsTableViewController.h"
#import "FISDataStore.h"

@interface FISSearchViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) FISDataStore *store;

@end

@implementation FISSearchViewController

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
    self.store = [FISDataStore sharedDataStore];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FISResultsTableViewController *destination = segue.destinationViewController;
    destination.searchIndex = self.segmentedControl.selectedSegmentIndex;
    NSString *searchKey = [self.searchTextField.text lowercaseString];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"FISDanceMove"];
    
    if (self.segmentedControl.selectedSegmentIndex == 0)
    {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", @"name", searchKey];
        [request setPredicate:searchPredicate];
        destination.searchQueryArray = [[self.store.managedObjectContext executeFetchRequest:request error:nil]mutableCopy];
        
    }
    else if (self.segmentedControl.selectedSegmentIndex == 1)
    {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", @"step1", searchKey];
        [request setPredicate:searchPredicate];
        destination.searchQueryArray = [[self.store.managedObjectContext executeFetchRequest:request error:nil]mutableCopy];
    }
    else if (self.segmentedControl.selectedSegmentIndex == 2)
    {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", @"step2", searchKey];
        [request setPredicate:searchPredicate];
        destination.searchQueryArray = [[self.store.managedObjectContext executeFetchRequest:request error:nil]mutableCopy];
    }
    else if (self.segmentedControl.selectedSegmentIndex == 3)
    {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", @"step3", searchKey];
        [request setPredicate:searchPredicate];
        destination.searchQueryArray = [[self.store.managedObjectContext executeFetchRequest:request error:nil]mutableCopy];
    }
    else if (self.segmentedControl.selectedSegmentIndex == 4)
    {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", @"step4", searchKey];
        [request setPredicate:searchPredicate];
        destination.searchQueryArray = [[self.store.managedObjectContext executeFetchRequest:request error:nil]mutableCopy];
    }
}


@end
