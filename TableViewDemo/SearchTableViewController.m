//
//  SearchTableViewController.m
//  TableViewDemo
//
//  Created by Brandon Trebitowski on 1/29/15.
//  Copyright (c) 2015 Pixegon. All rights reserved.
//

#import "SearchTableViewController.h"
#import "CharacteristicSelectionTableViewController.h"

@interface SearchTableViewController ()
@property(nonatomic, strong) NSString *characteristic1;
@property(nonatomic, strong) NSString *characteristic2;
@property(nonatomic, strong) NSString *characteristic3;
@property(nonatomic, strong) NSMutableArray *characteristics;
@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Preset startup model
    self.title = @"Characteristics";
    // Set some defaults
    self.characteristics = [@[@"Flexible",@"Rigid",@"Highly Flexible"] mutableCopy];
    // Background image
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section == 1) {
        return self.characteristics.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if(indexPath.section == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"Characteristic %ld",(long)indexPath.row+1];
        cell.detailTextLabel.text = self.characteristics[indexPath.row];

    } else {
        cell.textLabel.text = @"Fish";
        cell.detailTextLabel.text = @"";
    }
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @"Define its characteristics.";
    } else {
        return @"Some other section";
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"selectCharacteristics"]) {
        CharacteristicSelectionTableViewController *controller = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        SearchCallBackBlock callbackBlock = ^(NSString *result) {            
            self.characteristics[indexPath.row] = result;
        };
        controller.callbackBlock = callbackBlock;        
    }
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    if (indexPath.section == 0) {
        return NO;
    }
    return YES;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        // Wont do anything in this app since we are already at the root
        NSLog(@"would go back to the previous screen if we were not already at the root");
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
