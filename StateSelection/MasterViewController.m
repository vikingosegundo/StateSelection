//
//  MasterViewController.m
//  StateSelection
//
//  Created by Manuel Meyer on 25.09.13.
//  Copyright (c) 2013 bit.fritze. All rights reserved.
//

#import "MasterViewController.h"
#import "StateSelctionViewController.h"

@interface MasterViewController () <StateSelectionDelegate>
@property (nonatomic, strong) NSMutableDictionary *statesDictionray;
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
    
    self.statesDictionray = [@{} mutableCopy];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *selectedNation =[[[self.tableView cellForRowAtIndexPath:indexPath] textLabel] text];
        [[segue destinationViewController] setSelectedNation:selectedNation];
        [[segue destinationViewController] setDelegate:self];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text = _statesDictionray[cell.textLabel.text];
    return cell;
}

#pragma mark - State Selection Delegate
-(void)selectedState:(NSString *)state forNation:(NSString *)nation
{
    self.statesDictionray[nation] = state;
    [self.tableView reloadData];
}

@end
