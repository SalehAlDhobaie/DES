//
//  RoundViewController.m
//  DES
//
//  Created by Saleh AlDhobaie on 12/15/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import "RoundViewController.h"
#import "DetailsViewController.h"

@interface RoundViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RoundViewController

@synthesize tableView = _tableView;
@synthesize rounds = _rounds;

- (NSMutableArray *)rounds {
    if (!_rounds) {
        _rounds = [[NSMutableArray alloc]init];
    }
    return _rounds;
}

- (IBAction)dissmisViewController:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Details"]){
        [segue.destinationViewController setRound:[self.rounds objectAtIndex:[[self.tableView indexPathForSelectedRow]row]]];
        [segue.destinationViewController setNumberOfRound:[[self.tableView indexPathForSelectedRow]row]];
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.rounds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Round Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"Rounds %d", [indexPath row]];
    
    // Configure the cell...
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
