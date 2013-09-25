//
//  StateSelctionViewController.m
//  StateSelection
//
//  Created by Manuel Meyer on 25.09.13.
//  Copyright (c) 2013 bit.fritze. All rights reserved.
//

#import "StateSelctionViewController.h"



static NSDictionary *stateDictionary;
static NSString *CellIdentifier = @"MyStateCell";

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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];

    if (!stateDictionary) {
        stateDictionary = @{@"United States":@[@"Alabama", @"Alaska", @"Arizona",
                                               @"Arkansas", @"California", @"Colorado",
                                               @"Connecticut", @"Delaware", @"District of Columbia",
                                               @"Florida", @"Georgia", @"Hawaii",
                                               @"Idaho", @"Illinois", @"Indiana",
                                               @"Iowa", @"Kansas", @"Kentucky",
                                               @"Louisiana", @"Maine", @"Maryland",
                                               @"Massachusetts", @"Michigan", @"Minnesota",
                                               @"Mississippi", @"Missouri", @"Montana",
                                               @"Nebraska", @"Nevada", @"New Hampshire",
                                               @"New Jersey", @"New Mexico", @"New York",
                                               @"North Carolina", @"North Dakota", @"Ohio",
                                               @"Oklahoma", @"Oregon", @"Pennsylvania",
                                               @"Rhode Island", @"South Carolina", @"South Dakota",
                                               @"Tennessee", @"Texas", @"Utah", @"Vermont",
                                               @"Virginia", @"Washington", @"West Virginia",
                                               @"Wisconsin", @"Wyoming"],
                            @"Germany" : @[ @"Baden-Würtemberg", @"Bavaria",@"Berlin",
                                            @"Brandenburg",@"Bremen",@"Hamburg",
                                            @"Hesse", @"Lower Saxony" ,@"Mecklenburg-Vorpommern",
                                            @"North Rhine-Westphalia", @"Rhineland-Palatinate",
                                            @"Saarland",@"Saxony", @"Saxony-Anhalt",
                                            @"Schleswig-Holstein", @"Thuringia"]
                            };
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [stateDictionary[_selectedNation] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = stateDictionary[_selectedNation][indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate selectedState:stateDictionary[_selectedNation][indexPath.row] forNation:_selectedNation];
    if(self.presentingViewController)
        [self dismissViewControllerAnimated:NO completion:NULL];
    else
        [self.navigationController popViewControllerAnimated:YES];
    
}

@end
