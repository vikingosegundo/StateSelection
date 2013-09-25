//
//  StateSelctionViewController.m
//  StateSelection
//
//  Created by Manuel Meyer on 25.09.13.
//  Copyright (c) 2013 bit.fritze. All rights reserved.
//

#import "StateSelctionViewController.h"



static NSDictionary *stateDictionary;


@interface StateSelctionViewController ()

@end

@implementation StateSelctionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyClass"];

    if (!stateDictionary) {
        stateDictionary = @{@"United States":[NSArray arrayWithObjects:@"Alabama", @"Alaska", @"Arizona",
                                              @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"District of Columbia",
                                              @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas",
                                              @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota",
                                              @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire",
                                              @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio",     @"Oklahoma",
                                              @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota",
                                              @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia",
                                              @"Wisconsin", @"Wyoming", nil],
                            @"Germany" : @[ @"Baden-Würtemberg", @"Bavaria",@"Berlin",@"Brandenburg",@"Bremen",@"Hamburg", @"Hesse", @"Lower Saxony" ,@"Mecklenburg-Vorpommern", @"North Rhine-Westphalia", @"Rhineland-Palatinate", @"Saarland",@"Saxony", @"Saxony-Anhalt", @"Schleswig-Holstein", @"Thuringia"]
                            
                            }
        
        ;
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [stateDictionary[_selectedNation] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = stateDictionary[_selectedNation][indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate selectedState:stateDictionary[_selectedNation][indexPath.row] forNation:_selectedNation];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
