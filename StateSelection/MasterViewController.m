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

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.statesDictionray = [@{} mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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


-(void)selectedState:(NSString *)state forNation:(NSString *)nation
{
    self.statesDictionray[nation] = state;
    [self.tableView reloadData];
}

@end
